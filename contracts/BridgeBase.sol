// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract BridgeBase {
  address public admin;
  address public central = 0xb6037385dF109477e771B49D2D3573CdB628Ca00;
  IERC20 public token;
  uint public nonce;
  mapping(uint => bool) public processedNonces;

  enum Step { Hold, Release }
  event Transfer(
    address from,
    address to,
    uint amount,
    uint date,
    uint nonce,
    Step indexed step
  );

  constructor(address _token) {
    admin = msg.sender;
    token = IERC20(_token);
  }

  function hold(address to, uint amount) external {
    token.transfer(central, (amount+1));
    emit Transfer(
      msg.sender,
      to,
      amount,
      block.timestamp,
      nonce,
      Step.Hold
    );
    nonce++;
  }

  function release(address to, uint amount, uint otherChainNonce) external {
    require(msg.sender == admin, 'only admin can release tokens');
    require(processedNonces[otherChainNonce] == false, 'transfer already processed');
    processedNonces[otherChainNonce] = true;
    token.transfer(to, amount);
    emit Transfer(
      msg.sender,
      to,
      amount,
      block.timestamp,
      otherChainNonce,
      Step.Release
    );
  }
}
