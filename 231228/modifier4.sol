// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER4 {
    uint a;

    modifier plusoneBefore() {
        a++;
        _;
    }

    modifier plusoneAfter() {
        _;
        a++;
    }

    function setA(uint _n) public {
        a = _n;
    } 

    function getA() public view returns(uint) {
        return a;
    }

    function setA1() public plusoneBefore returns(bool) {
        if(a>=3) {
            return true;
        } else {
            return false;
        }
    }

    function setA2() public plusoneAfter returns(bool) {
        if(a>=3) {
            return true;
        } else {
            return false;
        }
    }
}