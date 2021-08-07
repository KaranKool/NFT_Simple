// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

import './BridgeBase.sol';

contract BridgeEth is BridgeBase {
  constructor() BridgeBase(IERC20(0x2E94E60d2Cfedf9645e6de550D54773610597563)) {}
}
