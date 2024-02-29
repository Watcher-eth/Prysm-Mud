import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Counter: {
      keySchema: {},
      valueSchema: "uint32",
    },
    UserBets: {
      keySchema: {
        betId: "uint32",
        userId: "address",
      },
      valueSchema: {
        // Link to the Bets table
        id: "uint32",
        betOptionId: "uint32", // 1 for A, 2 for B
        amount: "uint256", // Amount bet by the user
        option: "string", // Description of the option (e.g., "Yes", "No", "Best Folk Album")
      },
    },
    Topics: {
      keySchema: { id: "uint32" },
      valueSchema: {
        name: "string",
        genre: "string",
        description: "string",
      },
    },
    Bets: {
      keySchema: { id: "uint32" },
      valueSchema: {
        isResolved: "bool", // New field to indicate if the bet has been resolved
        outcome: "uint32", // Id of the option
        topicId: "uint32",
        endDate: "uint256",
        question: "string",
        title: "string",
        optionA: "string",
        optionB: "string",
      },
    },
    BetOptionTotals: {
      keySchema: {
        betId: "uint32",
        optionId: "uint32",
      },
      valueSchema: {
        totalBets: "uint32",
        totalAmount: "uint256",
      },
    },
  },
});
