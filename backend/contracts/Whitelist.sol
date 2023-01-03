//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // set the value of key (address) true if it's whitelisted
    mapping(address => bool) public whitelistedAddresses;

    // to keep track of how many addresses have been whitelisted so far
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted address at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    
    // This function adds the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check the whitelist limit
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        // Add the address which called the function to the whitelistedAddress array
        whitelistedAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }

    function isWhitelistedAddress(address user) external view returns(bool) {
        return whitelistedAddresses[user];
    }
}