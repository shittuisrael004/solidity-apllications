// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// Ether Wallet
// An example of a basic wallet.

// Anyone can send ETH.
// Only the owner can withdraw.

contract EtherWallet {

    error EtherWallet__NotOwner();
    error EtherWallet__InvalidAmount();

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    // function fund() external payable {}

    function withdraw(uint _amount) external {
        if (msg.sender != owner) revert EtherWallet__NotOwner();
        if (_amount > address(this).balance) revert EtherWallet__InvalidAmount();
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    // function getOwner() external view returns (address) {
    //     return owner;
    // }
}
