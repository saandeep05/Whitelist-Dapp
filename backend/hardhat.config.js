require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const {INFURA_URL, PRIVATE_KEY} = process.env;

module.exports = {
  solidity: "0.8.17",
  networks: {
    goerli: {
      url: INFURA_URL,
      accounts: [PRIVATE_KEY]
    }
  }
};
