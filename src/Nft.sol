// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Nft is ERC721, Ownable {
    using SafeMath for uint256;

    uint256 public tokenCount;
    mapping (uint256 => string) _tokenURIs;

    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol) Ownable()
    {}

    modifier existence(uint tokenId) {
        require(_exists(tokenId), "ERC721/does-not-exist");
        _;
    }

    function _setTokenURI(uint256 _tokenId, string memory _tokenURI) internal existence(_tokenId) {
        _tokenURIs[_tokenId] = _tokenURI;
    }

    function tokenURI(uint256 tokenId) public view override existence(tokenId) returns (string memory) {
        return _tokenURIs[tokenId];
    }

    function mint(address _to, string calldata _tokenURI) external onlyOwner returns (uint256) {
        _mint(_to, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        tokenCount = tokenCount.add(1);
        return tokenCount;
    }
}
