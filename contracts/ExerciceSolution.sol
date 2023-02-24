pragma solidity ^0.6.0;

import "./IExerciceSolution.sol";
import "./MyToken.sol";

contract ExerciceSolution is IExerciceSolution{

    MyToken public mytoken;

    constructor(MyToken _mytoken)public{
        mytoken = _mytoken;
    }   

    function ERC721Address() external override returns (address){
        return address(mytoken);
    }

	function mintATokenForMe() external override returns (uint256){
        mytoken.GetNewToken(msg.sender);
    }

	function mintATokenForMeWithASignature(bytes calldata _signature) external override returns (uint256){

    }

	function getAddressFromSignature(bytes32 _hash, bytes calldata _signature) external override returns (address){

    }

	function signerIsWhitelisted(bytes32 _hash, bytes calldata _signature) external override returns (bool){

    }

	function whitelist(address _signer) external override returns (bool){

    }
}