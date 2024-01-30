// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract Lock {
    uint public a = 10;
    string public b = "abc";
    bytes1 public c  = 0x12;
    uint public d;

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    function getAdd(uint _n) public view returns(uint) {
        return a+_n;
    }

    function getAdd_2(uint _a, uint _b) public {
        d = _a+_b;
    }

    function getString(string memory _b) public view returns(string memory) {
        console.log("getting result");
        return string(abi.encodePacked(b, _b));
    }
}