// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract FOR2 {
    uint[] numbers;

    function push(uint a) public {
        numbers.push(a);
    }

    function getArray() public view returns(uint[] memory) {
        return numbers;
    }

    // numbers 안의 값들에 모두 2씩 더해주는 함수.
    function addTwoAll() public {
        for(uint i = 0; i < numbers.length; i++) {
            numbers[i] += 2;
        }
    }

    // addTwoAll 함수는 계속 상태변수를 바꾸기 때문에 비용이 듬.
    // addTowAll2 함수는 가스비(transaction cost) 소모 x
    function addTwoAll2(uint[] memory _numbers) public pure returns(uint[] memory) {
        for(uint i=0; i<_numbers.length; i++) {
            _numbers[i] += 2;
        }
        return _numbers;
    }

    /* addTwoAll2 함수는 직접 input 값을 넣어줘야 함.
        그럼 numbers에 각 값들에 2를 더한 값을 보고싶을 때는 어떻게 해야될까?
    */
    function addTwoAll3() public view returns(uint[] memory) {
        uint[] memory a = numbers;
        for(uint i=0; i<numbers.length; i++) {
            a[i] += 2;
        }

        return a;
    }
    // 상태변수를 참조하되, 가스비는 소모하지 않음. 상태변수를 변경시키지 않음!

}