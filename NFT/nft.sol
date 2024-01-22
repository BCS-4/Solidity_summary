// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC721Enumerable {
    
    string public metaDataURI;
    constructor() ERC721("LikeLion NFT", "LL") {}
    
    function mintNFT(string memory _URI, uint _tokenId) public {
        metaDataURI = _URI;
        _mint(msg.sender, _tokenId);
    }

    function tokenURI(uint _tokenId) public view override returns (string memory){
        return string(abi.encodePacked(metaDataURI));
    }

}

/*
    function tokenURI(uint256 tokenId) public view virtual returns (string memory) {
        _requireOwned(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string.concat(baseURI, tokenId.toString()) : "";
    }

    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }


*/