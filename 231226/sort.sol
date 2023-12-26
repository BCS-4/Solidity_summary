// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract findLowest {
    // 숫자를 넣을 때 마다, 가장 작은수를 지속적으로 찾는 함수를 만들어보세요.
    uint[] numbers;
    uint lowest = 2**256-1;

    function pushNumber(uint _n) public {
        numbers.push(_n);
        setLowest(_n);
    }

    function setLowest(uint _n) public {
        if(lowest > _n) {
            lowest = _n;
        }
    }

    function getLowest() public view returns(uint) {
        return lowest;
    }

    function returnNumbers() public view returns(uint[] memory) {
        return numbers;
    }

}

contract findBiggest {
    // 숫자를 넣을 때 마다, 가장 큰수를 지속적으로 찾는 함수를 만들어보세요.

    uint[] numbers;
    uint biggest=0;

    function pushNumber(uint _n) public {
        numbers.push(_n);
        setBiggest(_n);
    }

    function setBiggest(uint _n) public {
        if(biggest < _n) {
            biggest = _n;
        }
    }

    function getBiggest() public view returns(uint) {
        return biggest;
    }

    function returnNumbers() public view returns(uint[] memory) {
        return numbers;
    }
}

