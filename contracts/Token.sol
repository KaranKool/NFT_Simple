// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
/**
 * @title Owner
 * @dev Set & change owner
 */
contract Token is ERC20 {
    address public admin;
    //mint 10000 tokens and send to owner
    constructor () ERC20 ("KaranTest", "KKT") {
        _mint(msg.sender, 10000 * 10 ** 18);
        admin = msg.sender;
    }
    function updateAdmin(address newAdmin) external {
        require(msg.sender == admin, 'only admin can change admin');
        admin = newAdmin;
    }
}