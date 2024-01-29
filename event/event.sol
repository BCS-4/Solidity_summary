// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.8.2 < 0.9.0;

contract EVENT1 {
    
    // event형 변수 선언
    event ADD(string name, uint result);
    event SUB(string name, uint result);
    event MUL(string name, uint result);
    event DIV(string name, uint result);

    // event = 상태변수. view / pure 사용 x
    function add(uint _a, uint _b) public returns(uint) {
        emit ADD("Plus", _a + _b);
        return _a + _b;
    }

    function sub(uint _a, uint _b) public returns(uint) {
        emit SUB("Minus", _a - _b);
        return _a - _b;
    }

    function mul(uint _a, uint _b) public returns(uint) {
        emit MUL("Times", _a * _b);
        return _a * _b;
    }

    function div(uint _a, uint _b) public returns(uint) {
        emit DIV("Divide", _a / _b);
        return _a / _b;
    }
}

contract EVENT2 {
    // 툭정 상황에서만 emit 되도록.
    event higherThanTen(uint a);

    function add(uint _a, uint _b) public {
        uint _c = _a + _b;

        if(_c >= 10) {
            emit higherThanTen(_c);
        }
    }
}

contract CHAINID {
    function getChainID() public view returns(uint) {
        return block.chainid;
    }
}

contract indexed_event {
    event index_1(uint indexed _num, string _name);

    function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
    }
}

contract indexed_event2 {
    event index_1(uint _num, string indexed _name);

    function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
    }
}

contract indexed_event3 {
    event index_1(uint indexed _num, string indexed _name);

    function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
    }
}