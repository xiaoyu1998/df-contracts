// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import "./TokenUtils.sol";
import "../error/Errors.sol";

// @title Bank
// @dev Contract to handle storing and transferring of tokens
contract Bank {
    using SafeERC20 for IERC20;

    constructor(){}

    // @dev transfer tokens from this contract to a receiver
    //
    // @param token the token to transfer
    // @param amount the amount to transfer
    // @param receiver the address to transfer to
    function transferOut(
        address token,
        address receiver,
        uint256 amount
    ) internal {
        _transferOut(token, receiver, amount);
    }

    // @dev transfer tokens from this contract to a receiver
    //
    // @param token the token to transfer
    // @param amount the amount to transfer
    // @param receiver the address to transfer to
    function _transferOut(
        address token,
        address receiver,
        uint256 amount
    ) internal {
        if (receiver == address(this)) {
            revert Errors.SelfTransferNotSupported(receiver);
        }

        TokenUtils.transfer(token, receiver, amount);

        _afterTransferOut(token);
    }

    function _afterTransferOut(address /* token */) internal virtual {}
}
