// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER {
    uint mutex = 0;
    uint a = 0;

    function getMutex() public view returns(uint) {
        return mutex;
    }

    function getA() public view returns(uint) {
        return a;
    }

    modifier m_use {
        mutex++;
        _;
        mutex--;
    }

    modifier m_notZero {
        require(mutex == 0, "go back");
        _;
        a++;
    }

    function USE1() public m_use m_notZero {}

    function USE2() public m_notZero m_use {
        a++;
    }

    function USE2_2() public m_notZero m_use {
        a++;
    }

}