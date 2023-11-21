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
constructor(address _tokenA, address _tokenB) {
        require(_tokenA != address(0), "Invalid tokenA address");
        require(_tokenB != address(0), "Invalid tokenB address");

        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
    }
function swapTokens(uint256 _amountA, uint256 _amountB) external {
        require(_amountA > 0 && _amountB > 0, "Amounts must be greater than 0");

        // Transfer tokens from the sender to the contract
        tokenA.safeTransferFrom(msg.sender, address(this), _amountA);
        tokenB.safeTransferFrom(msg.sender, address(this), _amountB);

        // Swap logic can be customized based on the requirements
        // For simplicity, let's assume a 1:1 swap ratio
        // Additional logic for more complex swaps can be implemented here

        // Transfer swapped tokens back to the sender
        tokenA.safeTransfer(msg.sender, _amountB);
        tokenB.safeTransfer(msg.sender, _amountA);

        emit TokensSwapped(msg.sender, _amountA, _amountB);
    }
}

