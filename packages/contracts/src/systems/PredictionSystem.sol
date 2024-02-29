// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import { Bets, BetsData, BerOptionsTotals, BetOptionTotalsData } from "../codegen/index.sol";

contract PredictionSystem is System {
function createNewBet(
    string memory Question,
    string memory Title,
    string memory OptionA,
    string memory OptionB,
    uint256 EndDate
    uint32 Topic
) public returns (BetsData memory) {
    // Generate betId, for simplicity, let's assume it's incremented and tracked elsewhere
    uint32 betId = getNextBetId();

    // Register bet with Oracle or relevant system
    Bets.set(betId, BetsData({
        isResolved: false,
        outcome: 0,
        topicId: Topic,
        endDate: EndDate,
        question: Question,
        title: Title,
        optionA: OptionA,
        optionB: OptionB
    }));

    // Initialize BetOptionTotals for OptionA (optionId = 1) and OptionB (optionId = 2) with zero totals
    BetOptionTotals.set(betId, 1, BetOptionTotalsData({
        totalBets: 0,
        totalAmount: 0
    }));

    BetOptionTotals.set(betId, 2, BetOptionTotalsData({
        totalBets: 0,
        totalAmount: 0
    }));

    // Return the newly created bet
    BetsData memory bet = Bets.get(betId);
    return bet;
  }


  function endBet( uint32 betId,) public {

    //TODO: Connect with Oracle and request Data resolution
    //Update table
    //Payout Winners
  }

   function payoutWinners( uint32 betId, uint32 outcome) public {
    // TODO: Get all voters for betId and outcome

    //TODO: increase point balance for each winner based on bet amount
  }

  /**
 * Gets the total amount bet for a specified option and betId.
 * 
 * @param betId The ID of the bet.
 * @param optionId The ID of the option (1 for OptionA, 2 for OptionB).
 * @return totalAmount The total amount bet for the specified option.
 */
function getTotalBetForOption(uint32 betId, uint32 optionId) public view returns (uint256 totalAmount) {
    BetOptionTotalsData memory totals = BetOptionTotals.get(betId, optionId);
    return totals.totalAmount;
}

}
