// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {

    string public name;
    string public symbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        totalSupply = 0;
    }

    function mintTokens(address account, uint256 amount) public {
        require(account != address(0), "Mint to the zero address");
        totalSupply += amount;
        balances[account] += amount;
    }

    function burnTokens(address account, uint256 amount) public {
        require(account != address(0), "Burn from the zero address");
        require(balances[account] >= amount, "Insufficient balance to burn");
        totalSupply -= amount;
        balances[account] -= amount;
    }
}