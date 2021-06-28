// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/utils/cryptography/ECDSA.sol';

contract DAPP is ERC20 {
    
    address public ownerAddress;
    address public minter;
    bytes32 private immutable _PERMIT_TYPEHASH = keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");
    bytes32 public DOMAIN_SEPARATOR;
    mapping(address => uint) public nonces;

    constructor(address _owner, address _minter) ERC20("DAPP TOKEN", "DAPP") {
        ownerAddress = _owner;
        minter = _minter;
        DOMAIN_SEPARATOR = keccak256(
            abi.encode(
                keccak256('EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)'),
                keccak256(bytes(name())),
                keccak256(bytes('1')),
                1,
                address(this)
            )
        );
    }
    
    function mint(address account, uint _amount) public {
        require(msg.sender == minter, 'Only minter can mint');
        _mint(account, _amount);
    }
       
    function burn(address account, uint _amount) public {
        require(account == msg.sender, 'Cant burn others tokens');
        _burn(account, _amount);
    }
    
    function decimals() public view virtual override returns (uint8) {
        return 4;
    }
 
    function transferOwnership(address _owner) public{
        require(msg.sender == ownerAddress, 'Only Owner can call this');
        ownerAddress = _owner;
    }
    
     function changeMinter(address _minter) public{
        require(msg.sender == ownerAddress, 'Only Owner can call this');
        minter = _minter;
    }
    
     function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external {
        require(deadline >= block.timestamp, 'DEADLINE EXPIRED');
        bytes32 digest = keccak256(
            abi.encodePacked(
                '\x19\x01',
                DOMAIN_SEPARATOR,
                keccak256(abi.encode(_PERMIT_TYPEHASH, owner, spender, value, nonces[owner]++, deadline))
            )
        );
        address recoveredAddress = ECDSA.recover(digest, v, r, s);
        require(recoveredAddress != address(0) && recoveredAddress == owner, 'INVALID_SIGNATURE');
        _approve(owner, spender, value);
    }
}