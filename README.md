DAPP ERC20 token contract

This contract has been written by following ERC20 standards, just we have two special accounts having some extra privileges.
 
1 Owner Address
2 Bridge Contract Address
 
Bridge Contract Address - 
Actually bridge contract is also their in openzepllin ERC20 standard there they called it minter,
so only bridge contract can mint the tokens. Other than minitng bridge contract address can not do anything
 
Owner Address - Owner has only two privilege it can update the bridge contract(minter) address and can transfer ownership to some other address, other than that owner cant do anything.