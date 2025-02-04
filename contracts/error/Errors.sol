// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.20;

library Errors {
    //TokenUtils errors
    error TokenTransferError(address token, address receiver, uint256 amount);

    //Bank
    error SelfTransferNotSupported(address receiver);

    //vault
    error SubscriptionPeriodCanNotWithdraw();
    error BelowVaultHealthThrehold(uint256 healthFactor, uint256 fundHealthThreshold);
    error EmptyShares(address account);
    error TransferAmountExeceedsBalance(address from, uint256 shareBalance, uint256 transferAmount);

    //vault
    error WithdrawOrderClosed(address account);
    error EmptyWithdrawOrder(address account);
    error LessThanOneDay();

}
