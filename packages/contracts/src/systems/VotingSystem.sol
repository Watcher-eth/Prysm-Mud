// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import { Bets, BetsData } from "../codegen/index.sol";
import { BetOptions, BetOptionsData } from "../codegen/index.sol";
import { UserBets, UserBetsData } from "../codegen/index.sol";
import { User, UserData } from "../codegen/index.sol";

contract VotingSystem is System {
  function VoteForOption(uint32 BetId, uint256 Amount,uint32 OptionId) public returns (bool) {
    UserData memory currentUser = User.get(_msgSender());
    //Todo: get Option description (e.g: Yes)
    string memory optionText = "Yes";
    bool result = false; 
    require(currentUser.pointsBalance > Amount);
    UserBets.set(BetId, userId: _msgSender(), UserBetsData({ betId: BetId, betOptionId: OptionId, amount: Amount, option: optionText }));
    result = true;
    return result;
  }

  function ReferralVoteForOption(uint32 BetId, uint32 OptionId, uint256 Amount, address referree) public returns (bool) {
    UserData memory currentUser = User.get(_msgSender());
    bool result = false;
    //Todo: get Option description (e.g: Yes)
    string memory optionText = "Yes";

    require(currentUser.pointsBalance > Amount, "Not enough points");
    UserBets.set(BetId, userId: referree, UserBetsData({ betId: BetId, betOptionId: OptionId, amount: Amount, option: optionText }));
    result = true;
    return result;
  }

     * Checks if a user has made a bet on a specific BetId and returns the bet details if it exists.
     * 
     * @param betId The ID of the bet to check.
     * @param userId The address of the user to check for.
     * @return exists True if the user has made a bet, false otherwise.
     * @return betDetails The details of the bet if it exists.
     */
    function getUserBet(uint32 betId, address userId) public view returns (bool exists, UserBetsData memory betDetails) {
        try UserBets.get(betId, userId) returns (UserBetsData memory userBet) {
            // If the function call succeeds, we found a matching UserBet.
            return (true, userBet);
        } catch {
            // If the function call fails, no matching UserBet was found.
            // Return default values - note: betDetails will be initialized with default values for its type
            return (false, betDetails);
        }
    }

}
