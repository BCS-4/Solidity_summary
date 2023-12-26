// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract concat {
    function concat1(string memory _a, string memory _b) public pure returns(string memory) {
        return string.concat(_a, _b);
    }

    function concat2(string memory _a, string memory _b) public pure returns(string memory) {
        return string(abi.encodePacked(_a, _b));
    }

    function concat3(string memory _name, uint _age) public pure returns(string memory) {
        return string(abi.encodePacked("name : ", _name, "age : ", _age));
    }
}

contract HASH {
    
    function kec(string memory _a) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_a));
    }

    function kec2(string memory _a, string memory _b) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_a, _b));
    }

    /*
        kec 함수에 _a = ab 
        kec2 함수에 _a = a, _b = b 를 입력해서 두 함수를 비교해보면 값이 같음.
    */
}