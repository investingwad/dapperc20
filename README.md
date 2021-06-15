DAPP ERC20 token contract

This contract has been written by following ERC20 standards. 

DAD Bridge has assigned 2 accounts as following
1 Owner Address
2 Bridge Contract Address
 
Bridge Contract Address - 

Bridge contract is using openzepllin ERC20 standard as they call it minter,
so only bridge contract can mint and burn the tokens. Other than minitng and burning bridge contract address can not do anything
 
Owner Address - 
Owner has two privilege it can update the bridge contract(minter) address and can transfer ownership to some other address. No other action is allowed by Owner address. Owner address is msig by DAD DAO and it has 4/8 msig permissions assigned by DAD governance on EOS
