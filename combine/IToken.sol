//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IToken {
    function deposit(address user, bytes calldata depositData) external;
}