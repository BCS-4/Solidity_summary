// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract MAPPING4 {
    // A의 각 은행마다의 잔고를 알아보자.
    // 그럼 이름과 은행이 필요하겠죠? (string, string)
    // 그리고 그 은행과 잔액이 필요하겠죠? (string, uint)
    mapping(string => mapping(string => uint)) accounts;

    // _name의 _bank에 잔고 값 설정하기
    function setAccount(string memory _name, string memory _bank, uint _amount) public {
        accounts[_name][_bank] = _amount;
    }

    // _name으로 _bank의 잔고 가져오기
    function getAccount(string memory _name, string memory _bank) public view returns(uint) {
        return accounts[_name][_bank];
    }

}