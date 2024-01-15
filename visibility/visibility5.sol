// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}


contract Child is DAD {
    function who() virtual override public pure returns(string memory) {
        return DAD.who();
    }
}

// 손자 컨트랙트에서 조상 즉, DAD 컨트랙트의 함수를 가져다 쓸 수 있나? -> 있음.
// DAD를 상속받은 Child를 또 상속하기 때문에, Child에서의 함수명도 중복되면 virtual override 같이 사용
contract GrandChild is Child {
    function who() override public pure returns(string memory) {
        return DAD.who();
    }
}
