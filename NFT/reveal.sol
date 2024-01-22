// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract reveal is ERC721Enumerable {
    string public beforeURI;
    string public afterURI;
    bool public revealed;

    constructor(string memory _a, string memory _b) ERC721("LikeLion Reveal", "LLR1") {
        beforeURI = _a;
        afterURI = _b;
    }

    function mintNFT() public {
        uint tokenId = totalSupply()+1;
        _mint(msg.sender, tokenId);
    }

    function setStatus(bool _revealed) public {
        revealed = _revealed;
    }

    function tokenURI(uint tokenId) public override view returns(string memory) {
        if(revealed == false) {
            return string(abi.encodePacked(beforeURI));
        } else {
            return string(abi.encodePacked(afterURI));
        }
    }
}