// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract REQUIRE2 {
    // 아래 코드는 revert. bool의 초기값으 false임.
    function require2_1() public pure returns(uint) {
        uint a = 1;
        bool b;

        require(b, "go back");
        return a;
    }

    // 아래 코드는 실행 됨. require = unreachable code.
    // 즉, return 뒤는 접근 불가능.
    function require2_2() public pure returns(uint) {
        uint a = 1;
        bool b;

        return a;
        require(b, "go back");
    }
}