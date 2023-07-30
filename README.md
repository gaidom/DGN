# Avalanche Token

## Getting Started

### Installing

1. Clone or download the ZIP file of the project.
2. Extract the main folder to your local device.
3. Open the folder with VSCode and run the command `npm i` in the terminal to install the necessary dependencies.


### Execute the Program

#### Set Up the Local Hardhat Network

Once you've installed the required dependencies, navigate to the "hardhat.config.js" file and modify the 'accounts' section with your wallet's private key. Additionally, update the etherscan section with your personal API, which you can obtain by creating one at https://snowtrace.io/myapikey. To initiate the network, execute the command "npx hardhat run scripts/mint.js --network fuji."


#### To Deploy

To begin, obtain some Testnet AVAX from the faucet by visiting https://faucet.avax.network/ and accessing your wallet. Afterward, set up an Avalanche network in Metamask by adding a new network with the following details: Network Name - Avalanche Fuji C-Chain, New RPC URL - https://api.avax-test.network/ext/bc/C/rpc, ChainID - 43113, Symbol - AVAX, and Explorer - https://testnet.snowtrace.io/. Next, copy the contents of DegenToken.sol and paste them into Remix IDE. Proceed to compile the smart contract. In Remix Solidity IDE, locate the "Deploy & run transactions" panel, click on the "Environment" dropdown menu, and select "Injected Provider." Add the contract's address in the "At Address" section, and finally, click the "At Address" button to deploy the smart contract and test its functionalities.

## Authors
@grasyyyaaaa
