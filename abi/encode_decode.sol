// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract encodedecode {
    function encode(string memory _s1, uint _n, string memory _s2) public pure returns (bytes memory) {
        return (abi.encode(_s1, _n, _s2));
    }
    /*
    a, 12, b 결과 값
    0x
    0000000000000000000000000000000000000000000000000000000000000060    // offset
    000000000000000000000000000000000000000000000000000000000000000c    // 12
    00000000000000000000000000000000000000000000000000000000000000a0    // a, b offset
    0000000000000000000000000000000000000000000000000000000000000001    // a length
    6100000000000000000000000000000000000000000000000000000000000000    // a
    0000000000000000000000000000000000000000000000000000000000000001    // b length
    6200000000000000000000000000000000000000000000000000000000000000    // b
    */

    function decode(bytes memory data) public pure returns (string memory _s1, uint _n, string memory _s2) {
        (_s1, _n, _s2) = abi.decode(data, (string, uint, string));
    }
    /*
    위 encode 함수의 bytes 코드 입력하면 결과 값
    0: string: _s1 a
    1: uint256: _n 12
    2: string: _s2 b
    */

    function decode2(bytes memory data) public pure returns(bytes memory _b1, uint _n, bytes memory _b2) {
        (_b1, _n, _b2) = abi.decode(data, (bytes, uint, bytes));
    }
    /*
    위 encode 함수의 bytes 코드 입력하면 결과 값
    0: bytes: _b1 0x61
    1: uint256: _n 12
    2: bytes: _b2 0x62
    */

    function decode3(bytes memory data) public pure returns(bytes1 _b1, uint _n, bytes1 _b2) {
        (_b1, _n, _b2) = abi.decode(data, (bytes1, uint, bytes1));
    }
    /*
    위 encode 함수의 bytes 코드 입력하면 실행 안 됨.
    length 안 맞음.
    */

    // 숫자는 offset 없이 바로 나옴. 의도적으로 uint decode 확인해보자.
    function decode4(bytes memory data) public pure returns(uint _n1, uint _n2, uint _n3, uint _n4, uint _n5, uint _n6, uint _n7) {
        (_n1, _n2, _n3, _n4, _n5, _n6, _n7) = abi.decode(data, (uint, uint, uint, uint, uint, uint, uint));
    }
    /*
    위 encode 함수의 bytes 코드 입력하면 결과 값
    0: uint256: _n1 96
    1: uint256: _n2 12
    2: uint256: _n3 160
    3: uint256: _n4 1
    4: uint256: _n5 43874346312576839672212443538448152585028080127215369968075725190498334277632
    5: uint256: _n6 1
    6: uint256: _n7 44326659161160106060585767698638339725079916004815528421354856378029244940288
    */

    function decode5(bytes memory data) public pure returns(bytes32 _n1, bytes32 _n2, bytes32 _n3, bytes32 _n4, bytes32 _n5, bytes32 _n6, bytes32 _n7) {
        (_n1, _n2, _n3, _n4, _n5, _n6, _n7) = abi.decode(data, (bytes32, bytes32, bytes32, bytes32, bytes32, bytes32, bytes32));
    }
    /*
    위 encode 함수의 bytes 코드 입력하면 결과 값
    0: bytes32: _n1 0x0000000000000000000000000000000000000000000000000000000000000060
    1: bytes32: _n2 0x000000000000000000000000000000000000000000000000000000000000000c
    2: bytes32: _n3 0x00000000000000000000000000000000000000000000000000000000000000a0
    3: bytes32: _n4 0x0000000000000000000000000000000000000000000000000000000000000001
    4: bytes32: _n5 0x6100000000000000000000000000000000000000000000000000000000000000
    5: bytes32: _n6 0x0000000000000000000000000000000000000000000000000000000000000001
    6: bytes32: _n7 0x6200000000000000000000000000000000000000000000000000000000000000
    */

}