// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract ABCToken is ERC20("LikeLion", "LION") {
    constructor(uint totalSupply) {
        _mint(msg.sender, totalSupply);
    }

    function getName() public pure returns(string memory) {
        return "ERC20_2";
    }

    function getNumber() public pure returns(uint) {
        return 12345;
    }

    function MintToken(uint a) public {
        _mint(address(this), a);
    }

    function decimals() public pure override returns(uint8) {
        return 0;
    }

    receive() external payable{}
}