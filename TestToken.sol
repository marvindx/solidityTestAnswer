// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract TestToken is ERC20PresetMinterPauser {
    /**
     * @notice constructor
     * @param name TestToken
     * @param symbol TT
     */
    constructor(string memory name, string memory symbol)
        ERC20PresetMinterPauser(name, symbol)
    {
        // 预分配 10000000 TT
        _mint(msg.sender, 10000000 ether);
    }

    function mint(address to, uint256 amount) public override whenNotPaused {
        super.mint(to, amount);
    }
}
