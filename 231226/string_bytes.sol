// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract STRING_BYTES {
    function stringToBytes(string memory _s) public pure returns(bytes memory) {
        return bytes(_s);
    }

    function bytesToString(bytes memory _b) public pure returns(string memory) {
        return string(_b);
    }

    function bytesToString2(bytes memory _b) public pure returns(string memory) {
        return string(abi.encodePacked(_b));
    }
}