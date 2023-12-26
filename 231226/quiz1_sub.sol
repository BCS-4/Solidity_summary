// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Q1_sub {
    // String 비교하기. getString 함수는 아래와 같은 오류 발생함.
    // TypeError: Built-in binary operator == cannot be applied to types string memory and literal_string "abc".
    /*
    function getString(string memory _s) public pure returns(bool) {
        if(_s == "abc") {
            return true;
        } else {
            return false;
        }
    }
    */

    // 1. keccak 256 설명
    // 결과물이 256 bit로 출력됨. bytes로 처리해줌.
    /*
    function hashFunction(uint _n) public pure returns(bytes32) {
        return keccak256(_n);
    }
    
    여기까지만 하면 아래와 같은 에러 발생. TypeError: Invalid type for argument in function call.
    Invalid implicit conversion from uint256 to bytes memory requested.
    */

    /* 그럼 bytes로 감싸보자.
    function hashFunction(uint _n) public pure returns(bytes32) {
        return keccak256(bytes(_n));
    }

    TypeError: Explicit type conversion not allowed from "uint256" to "bytes memory".
    */

    // 2. bytes ↔ string 형변환.
    function hashFunction_string(string memory _n) public pure returns(bytes32) {
        return keccak256(bytes(_n));
    }

    // 3. abi.encodePacked
    function hashFunction_uint(uint _n) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_n));
    }

}