// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "erc721a/contracts/ERC721A.sol";

contract MyHeroToken is ERC721A {
    address public owner;

    uint256 public maxQuantity = 5;

    
    string baseUrl =
        "Your here should be my hero token base image url";


    string public prompt = "My HeroToken around the world";
    constructor() ERC721A("MyHeroToken", "MHT") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action!");
        _;
    }

    function mint(uint256 quantity) external payable onlyOwner {
        require(
            totalSupply() + quantity <= maxQuantity,
            "You can not mint more than 5"
        );
        _mint(msg.sender, quantity);
    }

    function _baseURI() internal view override returns (string memory) {
        return baseUrl;
    }

    function promptDescription() external view returns (string memory) {
        return prompt;
    }
}
