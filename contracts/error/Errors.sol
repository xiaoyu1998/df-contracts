// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.20;

library Errors {

    // TokenUtils errors
    error TokenTransferError(address token, address receiver, uint256 amount);

    //Bank
    error SelfTransferNotSupported(address receiver);

    //Pool
    error SubscriptionPeriodCanNotWithdraw();
    error BelowFundHealthThrehold(uint256 healthFactor, uint256 fundHealthThreshold);
    error EmptyShares(address account);

}
