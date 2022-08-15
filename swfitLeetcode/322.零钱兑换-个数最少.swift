// Leetcode 322.零钱兑换-个数最少.swift
class ChangeCoinSolution {
    func coinChange(coins :[Int], target :Int) -> Int {
        var dp = Array(repeating: target+1, count: target+1)
        dp[0] = 0
        for i in 1...target {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], 1+dp[i-coin])
                }
            }
        }
        return dp[target] > target ? -1 : dp[target]
    }
    func coinChangeC(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 0 { return -1 }
        if amount == 0 { return 0 }

        var dp: [Int] = [Int](repeating: 0, count: amount+1)
        dp[0] = 0

        for i in 1...amount {
            var min = Int.max
            for (_, coin) in coins.enumerated() {
                if i - coin >= 0 && dp[i-coin] < min {
                    min = dp[i-coin] + 1
                }
            }
            dp[i] = min
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}
