// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenSwap is Ownable {
    using SafeERC20 for IERC20;

    IERC20 public tokenA;
    IERC20 public tokenB;

    event TokensSwapped(address indexed sender, uint256 amountA, uint256 amountB);


}

