// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract VISIBILITY_Variable {
    // 같은 컨트랙트 내부이기 때문에 상태번수의 visibility는 상관없음. 모두 내부임. internal로 취급.
    uint a = 1;
    uint private b = 2;
    uint internal c = 3;
    uint public d = 4;

    uint[] numbers1;
    uint[] private numbers2;
    uint[] internal numbers3;
    uint[] public numbers4; // 배포하면 값을 입력 할 수 있게 되어있음. set4함수에 1,2,3,4,5를 입력하고 numbers에 1 값을 입력하면 배열 1번째 값이 나옴.

    mapping(uint => string) mapping1;
    mapping(uint => string) private mapping2;
    mapping(uint => string) internal mapping3;
    mapping(uint => string) public mapping4;    // 배포하면 값을 입력 할 수 있게 되어있음. 이유는 numbers4와 같음.

    struct A {
        uint a;
        string b;
    }

    A a_1;
    A private a_2;
    A internal a_3;
    A public a_4;   // 배포하면 값을 입력 할 수 있게 되어있음. 이유는 numbers4와 같음. struct 값은 다 나옴.

    function set1(uint[] memory _n) public {
        numbers1 = _n;
    }

    function set2(uint[] memory _n) public {
        numbers2 = _n;
    }

    function set3(uint[] memory _n) public {
        numbers3 = _n;
    }

    function setm1(uint _n, string memory _s) public {
        mapping1[_n] = _s;
    }
    function setm2(uint _n, string memory _s) public {
        mapping2[_n] = _s;
    }
    function setm3(uint _n, string memory _s) public {
        mapping3[_n] = _s;
    }
    function setm4(uint _n, string memory _s) public {
        mapping4[_n] = _s;
    }

    function sets1(A memory _a) public {
        a_1 = _a;
    }
    function sets2(A memory _a) public {
        a_2 = _a;
    }
    function sets3(A memory _a) public {
        a_3 = _a;
    }
    function sets4(A memory _a) public {
        a_4 = _a;
    }

    function getABCD() public view returns(uint, uint, uint, uint) {
        return (a, b, c, d);
    }
}

// CA는 키가 없음. 따라서 만드는 사람 주소, nonce값, 코드로 정해짐.
// 새로고침 후 다같이 다시 배포하면 CA값은 같게나옴.
contract DAD {
    function getAddress() public view returns(address) {
        return address(this);
    }
}

contract MOM {
    // 서로 다른 2개의 tab 띄운 후에, 새로고침하고 주소 확인해보기
    // DAD형 husband, husband2는 상태변수임! 체인에 기록됨!
    DAD husband = new DAD();
    DAD husband2 = new DAD();

    function getAddress() public view returns(address) {
        return address(this);
    }

    function h_address() public view returns(address) {
        return address(husband);
    }

    function h_address2() public view returns(address) {
        return husband.getAddress();
    }

    function h_address2_1() public view returns(address) {
        return address(husband2);
    
    }
    function h_address2_2() public view returns(address) {
        return husband2.getAddress();
    }


}