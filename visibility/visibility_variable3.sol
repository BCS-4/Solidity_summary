// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    uint public a;
    uint[] public b;

    function getAddress() public view returns(address) {
        return address(this);
    }

    function setA(uint _n) public {
        a = _n;
    }

    function setB(uint[] memory _b) public {
        b = _b;
    }
}

/*
    1. husband, husband2 주소 확인
    2. 복사해서 dad contract 각 각 주소에 배포하기 (at address 이용)
    3. dad, dad2에서 변수 변경하기
    4. getH1a, getH1b, getH2a, getH2b 함수로 변경된 변수 확인
*/

contract MOM {
    // 배포 후, husband 주소를 At address에 넣고 At address로 배포하기
    // At Address 배포 후 DAD 컨트랙트의 setA, setB를 해준 후, get 함수들을 실행하면 값을 따라감.
    DAD public husband = new DAD();
    DAD public husband2 = new DAD();

    function getH1a() public view returns(uint) {
        return husband.a();
    }

    function getH1b() public view returns(uint) {
        return husband.b(1);
    }

    function getH2a() public view returns(uint) {
        return husband2.a();
    }

    function getH2b() public view returns(uint) {
        return husband2.b(1);
    }

}