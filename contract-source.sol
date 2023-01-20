//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract IntroToBlockchainNFT is ERC721URIStorage, Ownable {
    uint256 private tokenNo; 
    string private URI = "ipfs://bafkreidjaecmjth2n3dricle3nxr6hhrhqfvwce4q5gx4w2ol5bydufyv4";
   
    constructor() ERC721("IntroToBlockchainNFT", "CIS2330NFT") {}

    function mintNFT() public isInAddressBook(msg.sender)  {
        require (tokenNo +1 > tokenNo);
        tokenNo++;
        
        uint256 newItemId = tokenNo;
        
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, URI);
    }

    mapping (address => string) public AddressBook ;

    function enterAddressIntoBook(string memory name) public {
        AddressBook[msg.sender] = name;
    }

    modifier isInAddressBook(address addr) {
        require (bytes(AddressBook[addr]).length > 0);
        _;
    }    
}