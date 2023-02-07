// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "https://github.com/SOFZP/VIK-Token-Smart-Contract/blob/main/ERC20.sol";
import "https://github.com/SOFZP/VIK-Token-Smart-Contract/blob/main/ERC20Burnable.sol";
import "https://github.com/SOFZP/VIK-Token-Smart-Contract/blob/main/Ownable.sol";
import "https://github.com/SOFZP/VIK-Token-Smart-Contract/blob/main/draft-ERC20Permit.sol";
import "https://github.com/SOFZP/VIK-Token-Smart-Contract/blob/main/ERC20Votes.sol";

contract VIK is ERC20, ERC20Burnable, Ownable, ERC20Permit, ERC20Votes {
    constructor() ERC20("VIK", "VIK") ERC20Permit("VIK") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}
