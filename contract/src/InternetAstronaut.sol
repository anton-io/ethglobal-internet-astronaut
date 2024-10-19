// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract InternetAstronaut is ERC721Enumerable, Ownable(msg.sender) {
    uint256 private _tokenIdCounter;

    uint256 public starPrice;
    uint256 public maxStars;
    address public winner;
    bool public lotteryActive;

    mapping(address => uint256) public refunds;

    // Log events.
    event WinnerSelected(uint64 randomIndex, address indexed winner);

    constructor(
        uint256 _maxStars,
        uint256 _starPrice
    ) ERC721("InternetAstronaut", "STAR") {
        maxStars = _maxStars;
        starPrice = _starPrice;
        lotteryActive = false;
    }

    // Allow the lottery to be set active or inactive.
    function setLotteryActive(bool _active) public onlyOwner {
        lotteryActive = _active;
    }

    // Mint new stars (NFTs) by paying the required price.
    function mintStar() public payable {
        require(lotteryActive, "Lottery is not active");
        require(msg.value == starPrice, "Incorrect Ether value sent");
        require(_tokenIdCounter < maxStars, "All stars have been minted");

        _mintStar(msg.sender);
    }

    // Internal function to mint a star to the user.
    function _mintStar(address to) internal {
        uint256 tokenId = _tokenIdCounter;
        _safeMint(to, tokenId);
        _tokenIdCounter += 1;
    }

    // Function to select a winner randomly.
    function selectWinner() public onlyOwner {
        require(totalSupply() > 0, "No stars minted");

        // Use block hash and total supply to pseudo-randomly select a winner.
        // In the future, on in live production, this should be a more robust random function:
        uint64 randomIndex = getRandomInRange(0, uint64(totalSupply()));
        winner = ownerOf(randomIndex);
        lotteryActive = false; // End the lottery.

        emit WinnerSelected(randomIndex, winner);
    }

    // Refund function for everyone who minted stars.
    function refundAll() public onlyOwner {
        require(!lotteryActive, "Lottery is still active");

        // Refund all star holders the price they paid.
        for (uint256 i = 0; i < totalSupply(); i++) {
            address starHolder = ownerOf(i);
            refunds[starHolder] += starPrice;
        }
    }

    // Function for users to claim their refund.
    function claimRefund() public {
        uint256 refundAmount = refunds[msg.sender];
        require(refundAmount > 0, "No refund available");

        refunds[msg.sender] = 0; // Reset refund amount before transfer.
        (bool success, ) = msg.sender.call{value: refundAmount}("");
        require(success, "Refund failed");
    }

    // Withdraw function to allow funds to be used for the prize and admin.
    function withdraw() public onlyOwner {
        require(!lotteryActive, "Lottery is still active");

        uint256 contractBalance = address(this).balance;
        (bool success, ) = owner().call{value: contractBalance}("");
        require(success, "Withdrawal failed");
    }

    // Generate a random number between min and max.
    function getRandomInRange(uint64 min, uint64 max) public view returns (uint64) {
        address cadenceArch = 0x0000000000000000000000010000000000000001;

        // Static call to the Cadence Arch contract's revertibleRandom function
        (bool ok, bytes memory data) = cadenceArch.staticcall(abi.encodeWithSignature("revertibleRandom()"));
        require(ok, "Failed to fetch a random number through Cadence Arch");
        uint64 randomNumber = abi.decode(data, (uint64));

        // Return the number in the specified range
        return (randomNumber % (max + 1 - min)) + min;
	}
}