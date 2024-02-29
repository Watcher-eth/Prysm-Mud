/*
 * Create the system calls that the client can use to ask
 * for changes in the World state (using the System contracts).
 */

import { getComponentValue } from "@latticexyz/recs";
import { ClientComponents } from "./createClientComponents";
import { SetupNetworkResult } from "./setupNetwork";
import { singletonEntity } from "@latticexyz/store-sync/recs";
import { Address } from "viem";

export type SystemCalls = ReturnType<typeof createSystemCalls>;
interface TopicsData {
  name: string;
  genre: string;
  description: string;
}

interface UserBetsData {
  betId: number;
  userId: `0x${string}`; // Using template literal type for Ethereum address validation
  betOptionId: number;
  amount: number; // Representing the amount as bigint for compatibility with large numbers
  optionText: string;
}

export function createSystemCalls(
  /*
   * The parameter list informs TypeScript that:
   *
   * - The first parameter is expected to be a
   *   SetupNetworkResult, as defined in setupNetwork.ts
   *
   *   Out of this parameter, we only care about two fields:
   *   - worldContract (which comes from getContract, see
   *     https://github.com/latticexyz/mud/blob/main/templates/react/packages/client/src/mud/setupNetwork.ts#L63-L69).
   *
   *   - waitForTransaction (which comes from syncToRecs, see
   *     https://github.com/latticexyz/mud/blob/main/templates/react/packages/client/src/mud/setupNetwork.ts#L77-L83).
   *
   * - From the second parameter, which is a ClientComponent,
   *   we only care about Counter. This parameter comes to use
   *   through createClientComponents.ts, but it originates in
   *   syncToRecs
   *   (https://github.com/latticexyz/mud/blob/main/templates/react/packages/client/src/mud/setupNetwork.ts#L77-L83).
   */
  { worldContract, waitForTransaction }: SetupNetworkResult,
  { Counter }: ClientComponents
) {
  const increment = async () => {
    /*
     * Because IncrementSystem
     * (https://mud.dev/templates/typescript/contracts#incrementsystemsol)
     * is in the root namespace, `.increment` can be called directly
     * on the World contract.
     */
    const tx = await worldContract.write.increment();
    await waitForTransaction(tx);
    return getComponentValue(Counter, singletonEntity);
  };
  const addOption = async (
    description: string,
    option: string,
    betId: number
  ) => {
    /*
     * Because IncrementSystem
     * (https://mud.dev/templates/typescript/contracts#incrementsystemsol)
     * is in the root namespace, `.increment` can be called directly
     * on the World contract.
     */
    const tx = await worldContract.write.createNewOption([
      option,
      description,
      betId,
    ]);
    await waitForTransaction(tx);
    return getComponentValue(Counter, singletonEntity);
  };

  //POINTS
  const getPoints = async (did: `0x${string}`): Promise<number> => {
    const currentBalance = await worldContract.read.getPoints([did]);
    return Number(currentBalance);
  };

  const addPoints = async (
    did: `0x${string}`,
    amount: number
  ): Promise<string> => {
    const tx = await worldContract.write.addPoints([did, BigInt(amount)]);
    await waitForTransaction(tx);
    return "Points added successfully";
  };

  const removePoints = async (
    did: `0x${string}`,
    amount: number
  ): Promise<string> => {
    //  const tx = await worldContract.write.removePoints([did, amount]);
    // await waitForTransaction(tx);
    return "Points removed successfully";
  };

  const dailyRewards = async (
    did: `0x${string}`,
    multiplicator: number
  ): Promise<string> => {
    // const tx = await worldContract.write.dailyRewards([did, multiplicator]);
    //  await waitForTransaction(tx);
    return "Daily rewards distributed successfully";
  };

  //TOPICS
  const addTopic = async (
    name: string,
    genre: string,
    description: string
  ): Promise<string> => {
    const tx = await worldContract.write.addTopic([name, genre, description]);
    await waitForTransaction(tx);
    return "Topic added successfully";
  };

  // Implement the client-side function to get a topic by ID
  const getTopic = async (id: number): Promise<TopicsData> => {
    const topicData: TopicsData = await worldContract.read.getTopic([id]);
    return topicData;
  };

  const voteForOption = async (
    betId: number,
    amount: number,
    optionId: number,
    did: `0x${string}`
  ): Promise<boolean> => {
    // const tx = await worldContract.write.voteForOption([
    //   betId,
    //   BigInt(amount),
    //   optionId,
    //   did,
    // ]);
    // await waitForTransaction(tx);
    return true; // Assuming the transaction succeeds, adjust based on actual contract logic
  };

  // Implement the client-side function for referral voting
  const referralVoteForOption = async (
    betId: number,
    optionId: number,
    amount: number,
    referree: `0x${string}`,
    did: `0x${string}`
  ): Promise<boolean> => {
    // const tx = await worldContract.write.referralVoteForOption([
    //  betId,
    //  optionId,
    //  BigInt(amount),
    //  referree,
    //  did,
    // ]);
    // await waitForTransaction(tx);
    return true; // Assuming the transaction succeeds, adjust based on actual contract logic
  };

  // Implement the client-side function to check if a user has made a bet
  //  const getUserBet = async (
  //    betId: number,
  //   userId: `0x${string}`
  //  ): Promise<{ exists: boolean; betDetails?: UserBetsData }> => {
  //    try {
  //  const { exists, betDetails } = await worldContract.read.getUserBet([
  //    betId,
  //    userId,
  // ]);
  //  return { exists, betDetails };
  //   } catch (error) {
  // console.error(error);
  // return { exists: false };
  //   }
  // };

  return {
    increment, // existing function
    getPoints,
    addPoints,
    removePoints,
    dailyRewards,
    addTopic,
    getTopic,
  };
}
