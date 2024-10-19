// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloAstronaut {
    string public greeting = "Hello, Astronaut!";

    // Function to retrieve the greeting.
    function sayHello() public view returns (string memory) {
        return greeting;
    }

    // Function to update the greeting message.
    function setGreeting(string memory newGreeting) public {
        greeting = newGreeting;
    }
}