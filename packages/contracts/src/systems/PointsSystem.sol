// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import { User, UserData } from "../codegen/index.sol";

contract PointsSystem is System {
  function getPoints(address did) public view returns (uint256) {
    uint256 currentBalance = User.getPointsBalance(did);
    return currentBalance;
  }
  function addPoints(address did, uint256 amount) public {
    UserData memory user = User.get(did);
    uint256 currentBalance = user.pointsBalance;
    User.set(
      did,
      UserData({
        rank: user.rank,
        accuracy: user.accuracy,
        pointsBalance: currentBalance + amount,
        name: user.name,
        pfp: user.pfp
      })
    );
  }

function removePoints(address did, uint256 amount) public {
    UserData memory user = User.get(did);
    uint256 currentBalance = user.pointsBalance;
    require(currentBalance > amount)
    User.set(
      did,
      UserData({
        rank: user.rank,
        accuracy: user.accuracy,
        pointsBalance: currentBalance - amount,
        name: user.name,
        pfp: user.pfp
      })
    );
  }

  function DailyRewards(address did, uint32 multiplicator) public {
    UserData memory user = User.get(did);
    User.set(
      did,
      UserData({
        rank: user.rank,
        accuracy: user.accuracy,
        pointsBalance: 100 * multiplicator,
        name: user.name,
        pfp: user.pfp
      })
    );
  }
}
