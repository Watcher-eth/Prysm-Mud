// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import { Topics, TopicsData } from "../codegen/tables/Topics.sol";
import { Bets, BetsData } from "../codegen/tables/Bets.sol";

import { Counters } from "../codegen/tables/Counters.sol";

contract NewTopicSystem is System {
  function incrementCounter(uint32 counter) internal returns (uint32) {
    // Retrieve the current counter value
    uint32 currentCounter = Counters.get(counter);
    uint32 newCounter = currentCounter + 1;

    // Update the counter value in the table
    Counters.set(counter, newCounter);

    return newCounter;
  }

  function addTopic(string memory name, string memory genre, string memory description) public {
    uint32 newTopicId = incrementCounter(1);
    Topics.set(newTopicId, TopicsData({ name: name, genre: genre, description: description }));
  }
  function getTopic(uint32 id) public view returns (TopicsData memory) {
    return Topics.get(id);
  }

  //TODO: Get all topics

  // Get all Bets for a topic
}
