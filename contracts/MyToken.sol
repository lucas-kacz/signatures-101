pragma solidity ^0.6.0;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyToken is ERC721{

    constructor() ERC721("LucasNFT", "LFT") public {

    }

    uint256 id = 0;

    function GetNewToken(address recipient) external returns(uint256) {
        _mint(recipient, id);
        id++;
        return id-1;
    }

}