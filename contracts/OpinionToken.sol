//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IToken.sol";

contract OpinionToken is ERC20, IToken, Ownable {

    uint256 initialSupply = 100000;

    constructor() ERC20("OpinionToken", "OPT") {
        _mint(msg.sender, initialSupply * (10 ** uint256(decimals())));
    }
    function deposit(address to, bytes calldata depositData) external override onlyOwner {
        uint256 amount = abi.decode(depositData, (uint256));
        _mint(to, amount);
    }
    function withdraw(uint256 amount) external {
        _burn(_msgSender(), amount);
    }
}
