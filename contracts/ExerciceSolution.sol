pragma solidity ^0.6.0;

import "./IExerciceSolution.sol";
import "./MyToken.sol";

contract ExerciceSolution is IExerciceSolution{

    MyToken public mytoken;

    mapping(address => bool) public isWhitelisted;
    uint256 supply = 0;

    address public getSigner;

    constructor(MyToken _mytoken)public{
        mytoken = _mytoken;
        isWhitelisted[msg.sender] = true;
    }   

    function ERC721Address() external override returns (address){
        return address(mytoken);
    }

	function mintATokenForMe() external override returns (uint256){
        mytoken.GetNewToken(msg.sender);
        supply+=1;
        return supply-1;
    }

	function mintATokenForMeWithASignature(bytes calldata _signature) external override returns (uint256){
        mytoken.GetNewToken(msg.sender);
        supply+=1;
        return supply-1;
    }

	function getAddressFromSignature(bytes32 _hash, bytes calldata _signature) external override returns (address){
        getSigner = extractAddress(_hash, _signature);
        return getSigner;
    }

	function signerIsWhitelisted(bytes32 _hash, bytes calldata _signature) external override returns (bool){
        address signer = extractAddress(_hash, _signature);
        return isWhitelisted[signer];
    }

	function whitelist(address _signer) external override returns (bool){
        return isWhitelisted[_signer];
    }

    function getMessageHash() public view returns (bytes32) {
        address Evaluator = 0x657e2603c61eC6562258d72ce9E2C27E8537F81C;
        return keccak256(abi.encodePacked(Evaluator, tx.origin, 0x1d597f6a4fB74F9Ef8234397e4640Bac2c3B7518));
    }

    function extractAddress(bytes32 _hash, bytes memory _signature) 
    internal 
    pure 
    returns (address) {
        bytes32 r;
        bytes32 s;
        uint8 v;
        // Check the signature length
        if (_signature.length != 65) {
            return address(0);
        }
        // Divide the signature in r, s and v variables
        // ecrecover takes the signature parameters, and the only way to get them
        // currently is to use assembly.
        // solium-disable-next-line security/no-inline-assembly
        assembly {
            r := mload(add(_signature, 32))
            s := mload(add(_signature, 64))
            v := byte(0, mload(add(_signature, 96)))
        }
        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions
        if (v < 27) {
            v += 27;
        }
        // If the version is correct return the signer address
        if (v != 27 && v != 28) {
            return address(0);
        } else {
            // solium-disable-next-line arg-overflow
            return ecrecover(keccak256(
                abi.encodePacked("\x19Ethereum Signed Message:\n32", _hash)
                ), v, r, s);
        }
    }
}