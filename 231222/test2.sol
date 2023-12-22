// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract TEST2 {
    /* Q. 숫자만 들어가는 array를 구현하세요. 그 array에서 2의 배수들만 출력하는 함수를 구현하세요.*/
    uint[] numbers;
    
    function pushNumber(uint _n) public {
        numbers.push(_n);
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }

    /*
    function getOdds_2() public view returns(uint[] memory) {
        uint[] memory _odd;
        for(uint i=0; i < numbers.length; i++) {
            if(numbers[i] % 2 == 0) {
                // _odd.push(numbers[i]);   _odd에 push가 안됨! 지역변수에는 push를 할 수 없음.
                // _odd[i] = numbers[i];    문법상으로는 맞으나, 실행하면 overflow 오류 발생함.
                // push는 배열의 길이를 변화시킴.
            }
        }
        return _odd;
    }
    */

    function getOdds_2() public view returns(uint[] memory) {
        uint[] memory _odd = new uint[](10);  // 길이가 10인 array를 만들겠다는 의미. 일단 짝수갯수가 10개라고 가정해보자.

        uint index;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i]%2==0) {
                _odd[index] = numbers[i];
                index++;
            }
        }

        return _odd;
    }

    /* 위 getOdds 함수를 아래처럼 작성 할 수도 있음.
    function getOdds() public view returns(uint[10] memory) {
        uint[10] memory _odd; 

        uint index;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i]%2==0) {
                _odd[index] = numbers[i];
                index++;
            }
        }

        return _odd;
    }
        지역변수는 배열의 길이를 변경 할 수 없음. 즉, push, pop을 사용하지 못함. 길이를 정해줘야 함.
        위 getOdds, getOdds2 함수들은 배열의 길이를 10으로 고정해버렸음.
    */


    // 그럼, 짝수 갯수를 먼저 구해놓고 그 짝수 갯수를 지역변수 배열의 길이로 설정하면 되지 않을까?
    function getOddsCount() public view returns(uint) {
        uint index;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i]%2==0) {
                index++;
            }
        }

        return index;   // numbers의 짝수 갯수는 index임. 나온 index값으로 지역변수인 배열의 길이를 정해주자.
    }

    function getOdds() public view returns(uint[] memory) {
        uint[] memory _odd = new uint[](getOddsCount());

        uint index;

        for(uint i=0; i<numbers.length; i++) {
            if(numbers[i]%2==0) {
                _odd[index] = numbers[i];
                index++;
            }
        }

        return _odd;
    }

}