// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract VISIBILITY_1 {
    // 이 컨트랙트를 배포해보면 externalF, publicF만 사용 가능함!
    // 즉, external, public은 컨트랙트 외부에서도 실행 가능함.
    function privateF() private pure returns(string memory) {
        return "private";
    }

    function internalF() internal pure returns(string memory) {
        return "internal";
    }

    function publicF() public pure returns(string memory) {
        return "public";
    }

    function externalF() external pure returns(string memory) {
        return "external";
    }
}

contract VISIBILITY_2 {
    // 그럼 private, internal과 같은 컨트랙트 내부에서 실행되는 건 어떻게 실행해야될까?
    // 컨트랙트 내부에서 함수들 중에서 private, internal 접근해서 값을 가져오자.
    function privateF() private pure returns(string memory) {
        return "private";
    }

    function testPrivateF() public pure returns(string memory) {
        return privateF();
    }

    function internalF() internal pure returns(string memory) {
        return "internal";
    }

    function testInternalF() public pure returns(string memory) {
        // require(msg.sender == owner);
        return internalF();
    }

    function publicF() public pure returns(string memory) {
        return "public";
    }

    function externalF() external pure returns(string memory) {
        return "external";
    }

    // 밖에서는 접근하지 못하게 막았는데, 나도 접근을 못함. -> 그래서 testInternal과 같은 public함수를 만들었음.
    // 그런데 public이라 다른사람도 가능함. 어떻게 해야되나? -> require로 체크
}

contract Child is VISIBILITY_2 {
    function piblic_C() public pure returns(string memory) {
        return "public";
    }

    function internal_C() public pure returns(string memory) {
        return internalF();
    }

    /* 아래 함수는 오류가 발생함. private은 상속된 contract에서도 사용 불가함.
        private은 컨트랙트 내부에서만!
    function private_C() public pure returns(string memory) {
        return privateF();
    }
    */
}

contract Outsider {
    // VISIBILITY_1 형 vs
    VISIBILITY_1 vs = new VISIBILITY_1();

    // 상속은, 상속된 컨트랙트의 함수명을 그대로 가져다 썼지만, 외부에서 접근할 때는 아래와 같이 접근.
    function publicF_o() public view returns(string memory) {
        return vs.publicF();
    }

    function externalF_o() public view returns(string memory) {
        return vs.externalF();
    }

    /* 아래 함수도 접근하지 못함.
    function internalF_o() public view returns(string memory) {
        return vs.internalF();
    }
    */
}