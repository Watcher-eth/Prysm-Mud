// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

import { BetOptionsData } from "./../index.sol";

/**
 * @title IPredictionOptionSystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface IPredictionOptionSystem {
  function createNewOption(
    string memory Option,
    string memory Description,
    uint32 betId
  ) external returns (BetOptionsData memory);

  function getOption(uint32 betId) external returns (BetOptionsData memory);

  function getAllOptions(uint32 betId) external returns (BetOptionsData memory);
}
