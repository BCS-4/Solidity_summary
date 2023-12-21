// bool.sol
// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract BOOL {
    bool isFun;  // default 값은 false임.

    function Fun() public {
        isFun = true;
    }

    function notFun() public {
        isFun = false;
    }

    function reverse() public {
        isFun = !isFun;
    }

    // 0: false, 1: true 외에는 영향을 받지 않음.
    function setFun(bool _a) public {
        isFun = _a;
    }

    function getFun() public view returns(bool) {
        return isFun;
    }
}