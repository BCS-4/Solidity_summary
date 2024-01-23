// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract A {
    uint public a =100;
}

contract B {
    uint public a = 100;
    uint public b = 200;
}

contract C {
    function codeLength(address _addr) public view returns(uint) {
        return _addr.code.length;
    }
}

// _addr.code.length > 0 이면 _addr는 CA임.

