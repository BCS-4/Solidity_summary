// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Basic5 {
    bytes a;  // bytes의 default 값은 0x임.
    string b;

    /* 아래 함수도 오류가 발생함. memory / calldata 명확히 해달라!
    string은 특별한 형태의 bytes
    bytes는 특별한 형태의 array 
    string이 bytes 형태를 따라감.

    function setA(bytes _a) public {
        a = _a;
    }
    */

    // 1234를 넣으면 invalid arrayify value 오류가 발생함. 
    // 0x123을 넣으면 hex data is odd-length 오류가 발생함. (짝수 갯수를 넣어야 함)
    // 왜 짝수 갯수로 넣어야 할까요? 생각해보기!

    function setA(bytes memory _a) public {
        a = _a;
    }

    // 결과값 : 0x6162
    // ascii code table
    // 앞에 0x가 붙으면 16진수를 의미. string으로 변경하는건데 결과값이 bytes형태로 나오네?
    // 즉, string 형태로 넣어도 bytes 값으로 출력이 됨. bytes로 선언했으니.
    function setB() public {
        a = "ab";
    }

    function setC(string memory _a) public {
        a = bytes(_a); // string 형의 _a가 bytes형의 a로 저장됨.
    } 

    function setD() public {
        a = "12"; // 0x3132 -> 아스키코드 참고
    }

    function getA() public view returns(bytes memory) {
        return a;
    }


}