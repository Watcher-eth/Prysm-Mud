// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

/**
 * @title IPointsSystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface IPointsSystem {
  function getPoints(address did) external view returns (uint256);

  function addPoints(address did, uint256 amount) external;

  function DailyRewards(address did, uint32 multiplicator) external;
}
