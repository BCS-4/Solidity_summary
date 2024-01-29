// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyToken is ERC1155, Ownable {
    string public _URI;
    constructor() ERC1155("") Ownable(msg.sender) {}

    function setURI(string memory newuri) public onlyOwner {
        _URI = newuri;
    }

    function mintToken(uint _tokenId, uint _amount) public {
        _mint(msg.sender, _tokenId, _amount, "");
    }

    function uri(uint _tokenId) public override view returns(string memory) {
        return string(abi.encodePacked(_URI, '/', Strings.toString(_tokenId), '.json'));
    }

}

/*
    1. setURI 설정 : pinata 업로드 한 json 폴더 주소 넣기.(끝에 '/' 제거해야 함)
    2. mintToken : n번을 x개 입력해보기.
    3. rarible / opensea 에서 확인.
    4. minttoken : 나머지 토큰 5개씩 발행하기.
*/