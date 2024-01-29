// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract Lock {
    uint public a = 10;
    string public b = "abc";
    bytes1 public c = 0x12;

    uint public d;

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a+_b;
    }

    function getBC() public view returns(string memory, bytes1) {
        return(b, c);
    }

    function setD(uint _d) public {
        d = _d;
    }

    function testB(string memory _b) public view returns(string memory) {
        console.log("getting result");
        return string(abi.encodePacked(b, _b));
    }
}