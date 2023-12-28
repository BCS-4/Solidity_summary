// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract ADDRESS {
    // address의 초기값 : 0x0000000000000000000000000000000000000000
    address a;

    function setAddress(address _a) public {
        a = _a;
    }

    function getAddress() public view returns(address) {
        return a;
    }
}

contract ADDRESS_Payable {
    address a;
    address payable b;

    function setA() public {
        a = msg.sender;
    }

    function setB() public {
        b = payable(msg.sender);
    }

    function deposit() public payable returns(uint) {
        return msg.value;
    }

    function sendToB() public {
        b.transfer(0.1 ether);
    }


    function getAB() public view returns(address, address) {
        return (a, b);
    }
}

contract ADDRESS_This_Balance {
    address a;

    function deposit() public payable {}

    function setA() public {
        a = msg.sender;
    }

    function getBalance() public view returns(uint) {
        return a.balance;
    }

    function getBalance2() public view returns(uint) {
        return address(this).balance;
    }

    function getAddress_This() public view returns(address) {
        return address(this);
    }
}

contract ADDRESS_CONSTRUCTOR {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {}

    function getOwner() public view returns(address) {
        return owner;
    }

    function withdraw_1() public {
        owner.transfer(1 ether);
    }

    function withdraw_all() public {
        owner.transfer(address(this).balance);
    }

}

contract MSG {
    function getMSG() public view returns(address) {
        return msg.sender;
    }
}


