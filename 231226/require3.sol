// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract REQUIRE4 {
    bool isTrue;

    function setBOOL(uint _n) public {
        require(_n>=10 && _n%2==0, "go back");
        isTrue = true;
    }

    function getBOOL() public view returns(bool) {
        return isTrue;
    }
}