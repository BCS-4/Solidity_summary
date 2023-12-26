// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.15;

contract ABIENCODEPACKED {
    function getBytes(string memory _s) public pure returns(bytes memory) {
        return bytes(_s);
    }

    function getabiEncodePacked(string memory _s) public pure returns(bytes memory) {
        return abi.encodePacked(_s);
    }

    function getabiEncode(string memory _s) public pure returns(bytes memory) {
        return abi.encode(_s);
    }

    // 모두 a를 넣어보자.
    /* 결과값 ↓
        getabiEncode :  0x000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000016100000000000000000000000000000000000000000000000000000000000000
        getabiEncodePacked : 0x61
        getBytes : 0x61
    */


    // excution cost 비교
    /* abcd (4자리)를 넣어보자.

        getabiEncodePacked : 1916
        getBytes : 1462
    */

    /*  abcdabcdabcdabcd (16자리)를 넣어보자.

        getabiEncodePacked : 1916
        getBytes : 1462
    */

    /* abcdabcdabcdabcdabcdabcdabcdabcd (32자리) 를 넣어보자.

        getabiEncodePacked : 1919
        getBytes : 1462
    */
    
    
    /* abcdabcdabcdabcdabcdabcdabcdabcda (33자리) 를 넣어보자.

        getabiEncodePacked : 2078
        getBytes : 1546
    */

    /* abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcd (64자리) 를 넣어보자.
        getabiEncodePacked : 2081
        getBytes : 1546
    */

    /* abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcda (65자리) 를 넣어보자.
    
        getabiEncodePacked : 2240
        getBytes : 1630
    */

    // 위 결과를 봤을 때, 32bytes 기준으로(자릿수) excution cost 차이가 있음.
}