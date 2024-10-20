## Internet Astronaut 

**A Web3 Lottery for Space Exploration.**

Internet Astronaut is an innovative Web3-powered lottery that gives participants a once-in-a-lifetime opportunity to win a chance to become an astronaut.

By leveraging blockchain technology and cryptocurrency, the lottery is fully transparent, easy to participate in, and accessible to anyone around the world. 

The central idea is to sell digital tickets, called "Stars," to raise sufficient funds, and once all Stars are sold, a winner is chosen. The winner secures a spot in an astronaut training program, turning their dream of space travel into reality.

### Live Demo

Currently, there is a live demo available at https://InternetAstronaut.com. This demo uses a Flow testnet, that provides free tokes through their faucet as described below. 


### How does it work

1. **The Stars (NFTs as Tickets):**

* Participants can purchase Stars, which are NFTs representing lottery tickets. Each Star gives the participant an entry into the lottery.

* A smart contract governs the sale of Stars, ensuring that they are sold at a fixed price and distributed fairly. The contract transparently tracks all entries on the blockchain.

2. **Lottery Mechanism (Smart Contract):**

* Once all the Stars are sold, meaning sufficient funds have been raised, the lottery activates. A winner is selected randomly through the smart contract.

* Blockchain ensures that the entire process—from ticket sales to winner selection—is verifiable and tamper-proof.

3. **Transparency & Trust:**

* Web3 ensures that all transactions (ticket sales, fund accumulation, and winner selection) are fully transparent. Participants can easily view the entire process on the blockchain, giving them confidence that the lottery is fair and trustworthy.

4. **Global Accessibility:**

* By using cryptocurrency as the medium for payments, Internet Astronaut breaks down traditional barriers to entry, such as geographic location and currency limitations.
Anyone, anywhere, at any time, can purchase a Star using a Web3 wallet, making the process simple and accessible to a global audience.

 
5. **Becoming an Astronaut:**

* The winner of the lottery, selected from among the Star holders, is awarded a chance to participate in an astronaut training program. This tangible, life-changing reward brings the thrill of space exploration to the masses.


### How to Test the Project

Assuming You Are Using the Flow Blockchain: 

1. **Get Test Tokens:**
   - Obtain test tokens to interact with the contract by visiting the [Flow Faucet](https://faucet.flow.com/fund-account). Fund your test account to enable transactions.

2. **Build Dependencies:**
   - Ensure all necessary dependencies are installed (e.g., contract compiler) by running the build script:
     ```bash
     ./contract/_0_build
     ```

3. **Compile the Smart Contract:**
   - Compile the smart contract with the following command:
     ```bash
     ./contract/_1_compile
     ```

4. **Deploy the Smart Contract:**
   - Once the contract is compiled, deploy it to the Flow blockchain using the deployment script:
     ```bash
     ./contract/_2_deploy
     ```

5. **Interact with the Smart Contract:**
   - Explore the available functions within the contract by reviewing the scripts in:
     ```bash
     ./contract/_operator
     ```
   - Choose the functions you want to interact with or test.

6. **Customize the Frontend:**
   - Modify or extend the frontend by editing `./www/root/index.html` to create the desired user interactions or experiences.
   - To facilitate development, start a local web server to test your changes by running:
     ```bash
     ./www/_serve
     ```

    
### Improvement ideas

Following is a list ideas and features that could improve user experience: 
```
[ ] Extend contract to allow multiple simultaneous mints.
[ ] Store using a stable coin like USDC to increase price predictability. 
```