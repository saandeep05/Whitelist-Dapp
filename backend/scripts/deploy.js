const {ethers} = require("hardhat");

const main = async () => {
    const WhitelistContract = await ethers.getContractFactory("Whitelist");
    const whitelistContract = await WhitelistContract.deploy(10);
    await whitelistContract.deployed();

    console.log("Whitelist Contract deployed to:", whitelistContract.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
