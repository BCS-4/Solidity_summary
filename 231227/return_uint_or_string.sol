// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract RETURN_UINT_OR_STRING {
    // return 조건에 따라 string 또는 uint로 출력하고 싶을 때. -> abi.encodePacked() 사용
    function returnUintOrString(bool isString) public pure returns(bytes memory) {
        if(isString) {
            return abi.encodePacked("string");
        } else {
            uint number = 12345;
            return abi.encodePacked(number);
        }
    }
}