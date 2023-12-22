// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract TEST {
    /* Q. 숫자들만 들어가는 array 구현하고
    그 array를 숫자를 넣는 함수 그리고 전체 array를 반환하는 함수 그리고 특정 요소를 확인할 수 있는 함수
    */

    uint[] numbers;

    function pushNumber(uint _n) public {
        numbers.push(_n);
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }

    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n-1];
    }

    // array에 들어간 숫자들의 평균을 구하는 함수를 구현하세요
    function getAverage() public view returns(uint) {
        uint sum;
        for(uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum/numbers.length;
    }

    // 다름 함수 사용해서 해보기
    function getAverage3() public view returns(uint) {
        uint sum;

        for(uint i = 1; i < numbers.length+1; i++) {
            sum += getNumber(i);
        }
        
        return sum;
    }    

}
