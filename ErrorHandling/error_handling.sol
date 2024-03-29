// SPDX-License-Identifier: GPL-3.0

import '@openzeppelin/contracts/utils/Strings.sol'; 

pragma solidity ^0.8.15;

contract ErrorHandling {
    // require : 조건문 o, error message o

    // revert : 조건문 x, error message x

    // assert : 조건문 o, error message x, 내부에서만 써라(공식문서)

    // try,catch는 코드를 계속 실행시킬 수 있음. 에러메세지 자체 반환 
}

contract EH1 {
    function REQUIRE(uint _n) public pure returns(uint) {
        require(_n > 10, "nope");
        return _n;
    }

    function REVERT(uint _n) public pure returns(uint) {
        if(_n < 10) {
            revert("lower than 10");
        }
        return _n;
    }

    function ASSERT(uint _n) public pure returns(uint) {
        assert(_n<10);
        return _n;
    }
}

// try / caych 예시 1
contract EH2 {
    function div(uint _a, uint _b) public pure returns(uint) {
        return _a/_b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) returns(uint) {    // returns(uint)는 필수 요소 아님.
            return div(_a, _b);
        } catch {
            return 2;
        }
    }
}

// try / caych 예시 2
contract EH2_2 {
    function div(uint _a, uint _b) public pure returns(uint) {
        return _a/_b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) returns(uint) {
            return div(_a, _b);
        } catch Panic(uint _errorcode) {
            return _errorcode;
        } catch {
            return 2;
        }
    }
    /*
        10, 0을 넣으면 _errorcode는 18이 출력됨 -> 0x12
        그 뒤의 catch return 2까지 가지 못함.
    */
}

// try / caych 예시 3
contract EH2_3 {
    function div(uint _a, uint _b) public pure returns(uint) {
        require(_a!=10, "should not be ten");
        return _a/_b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) returns(uint) {
            return div(_a, _b);
        } catch Panic(uint _errorcode) {
            return _errorcode;
        } catch {
            return 2;
        }
    }
    /*
        10, 0을 넣으면 require에서 먼저 걸려서 error로 처리 됨.
        그래서 try/catch Panic을 안거치고 바로 catch로 넘어감.
        즉, 2가 출력 됨.
    */
}

// try / caych 예시 4
contract EH2_4 {
    function div(uint _a, uint _b) public pure returns(uint) {
        uint c = _a / _b; 
        require(_a!=10, "should not be ten");
        return c;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) returns(uint) {
            return div(_a, _b);
        } catch Panic(uint _errorcode) {
            return _errorcode;
        } catch {
            return 2;
        }
    }
    /*
        10, 0을 넣으면 에러코드 발생함 (18 = 0x12)
    */
}

// try / caych 예시 5
contract EH2_5 {
    function div(uint _a, uint _b) public pure returns(uint) {
        require(_a!=10, "should not be ten");
        return _a/_b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(uint) {
        try this.div(_a, _b) returns(uint) {
            return div(_a, _b);
        } catch Panic(uint _errorcode) {
            return _errorcode;
        } catch Error(string memory _reason) {
            return 1;
        } catch {
            return 2;
        }
    }
    /*
        catch Error는 string memory가 붙는걸로 암기.
        10, 0을 넣으면 panic에 안걸리고 Error에 걸림.
    */
}

// try / caych 예시 6
contract EH2_6 {
    function div(uint _a, uint _b) public pure returns(uint) {
        require(_a!=10, "should not be ten");
        return _a/_b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(string memory) {
        try this.div(_a, _b) returns(uint) {
            return Strings.toString(div(_a, _b));
        } catch Panic(uint _errorcode) {
            return Strings.toString(_errorcode);
        } catch Error(string memory _reason) {
            return _reason;
        } catch {
            return "last catch";
        }
    }
    /*
        import '@openzeppelin/contracts/utils/Strings.sol';  임포트 추가하기
        _a=10, _b=5를 넣어보면 should not be ten 이 출력됨.
        즉, _reason은 div함수 require의 조건이 일치 하지 않을 경우의 메세지가 출력됨.
    */
}

// try / caych 예시 7
contract EH2_7 {
    function div(uint _a, uint _b) public pure returns(uint) {
        require(_a!=10, "should not be ten");
        assert(_a!=12);
        return _a/_b;
    }

    function tryAndCatch(uint _a, uint _b) public view returns(string memory) {
        try this.div(_a, _b) returns(uint) {
            return Strings.toString(div(_a, _b));
        } catch Panic(uint _errorcode) {
            return Strings.toString(_errorcode);
        } catch Error(string memory _reason) {
            return _reason;
        } catch {
            return "last catch";
        }
    }
    /*
        import '@openzeppelin/contracts/utils/Strings.sol';  임포트 추가하기
        _a=12, _b=3 일경우 1(=0x01) 출력. 즉 panic에서 걸림.
    */
}

// try catch는 언제 사용하는게 좋을까?
// 리벌트, 어설트, 리콰이어는 롤백시킴.
// 상태변수를 변경하고 싶어서 어떤 함수를 실행했음. 어썰트/리벌트/리콰이어는 전부 롤백시킴.
// 이 때, 문제를 낸 상태변수와 문제를 내지 않은 상태변수가 있을 거임.

contract EH3 {
    uint public a;
    uint public b;
    uint public c;

    function numbers(uint _a, uint _b, uint _c) public {
        require(_a!=10, "should not be then");
        assert(_b!=8);
        (a, b, c) = (_a, _b, _c);
    }

    function trycatch(uint _a, uint _b, uint _c) public returns(string memory) {
        try this.numbers(_a, _b, _c) {
            return ("done");
        } catch Panic(uint _errorcode) {
            return Strings.toString(_errorcode);
        } catch Error(string memory _reason) {
            return _reason;
        } catch {
            return "last catch";
        }
    }

    /*  nunbers 함수에
        1) 1,2,3을 넣으면 잘 됨.
        2) 10, 7, 5를 넣으면 안 됨. (require 때문)

        trycatch 함수에
        1) 10, 7, 5를 넣으면 함수는 끝까지 실행 됨. (a 때문임)
        ※ 단, 값은 안바뀜.
    */
}

contract EH3_2 {
    uint public a;
    uint public b;
    uint public c;

    function numbers(uint _a, uint _b, uint _c) public {
        require(_a!=10, "should not be then");
        assert(_b!=8);
        (a, b, c) = (_a, _b, _c);
    }

    function trycatch(uint _a, uint _b, uint _c) public returns(string memory) {
        try this.numbers(_a, _b, _c) {
            return ("done");
        } catch Panic(uint _errorcode) {
            (a, c) = (_a, _c);
            return Strings.toString(_errorcode);
        } catch Error(string memory _reason) {
            (b, c) = (_b, _c);
            return _reason;
        } catch {
            return "last catch";
        }
    }

    /*  nunbers 함수에
        1) 10, 7, 5를 넣으면 안 됨. (require 때문)

        trycatch 함수에
        1) 10, 7, 5를 넣으면 함수는 끝까지 실행 됨.
        ※ 이 때, a 값은 변경되지 않고, b,c만 값이 변경 됨.
    */
}

contract ARRAY {
    uint[] public numbers;

    function pushNumber(uint _n) public {
        numbers.push(_n);
    }

    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n];
    }

    function divide(uint _a, uint _b) public pure returns(uint) {
        require(_a >= 10, "lower than 10");
        return _a/_b;
    }
    /*  panic
        1) 10을 0으로 나누면 revert 발생함.
        2) 배열 길이를 초과 한 값을 호출 할 때.
        -> decoded output 확인하기.
        3) divide 함수에 _a = 8, _b=0을 입력해서 실행해보면, require에서 걸림.
    */  
}