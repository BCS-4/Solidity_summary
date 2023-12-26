// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;
contract stringCompare {

    function hashFunction_uint(uint _n) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_n));
    }

    function hashFunction_string(string memory _n) public pure returns(bytes32) {
        return keccak256(bytes(_n));
    }

    function compare(string memory _s) public pure returns(bool) {
        // require를 사용해서 가스비 최적화.
        // require(bytes(_s).length == bytes("abc").length);

        if(keccak256(abi.encodePacked(_s))==keccak256(abi.encodePacked("abc"))) {
            return true;
        } else {
            return false;
        }
    }

    function compare_optimization(string memory _s) public pure returns(bool) {
        if(keccak256(abi.encodePacked(_s))==keccak256(abi.encodePacked("abc"))) {
            return true;
        } else {
            return false;
        }
    }
}
