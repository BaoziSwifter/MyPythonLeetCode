class CollectionMoney {
    func badCollectionMoney(coins: [Int], target: Int) -> Int {
        if target <= 0 {
            return 0
        }
        if target == 1 {
            return 1
        }

        var res = Int.max
        for coin in coins {
            let sub = badCollectionMoney(coins: coins, target: target-coin)
            if sub == -1 {
                continue
            }
            res = min(res, 1+sub)
        }
        return res == Int.max ? -1 : res
    }

    
    func change(_ target: Int, _ coins: [Int]) -> Int {
        if coins.count <= 0 { return 0 }
        if target == 0 { return 1 }
        // dp[i] 表示金额之和为i的硬币组合数
        var dp = [Int](repeating: 0, count: target + 1)
        dp[0] = 1
        for c in coins {
            for i in 1...target {
                guard i >= c else {
                    continue
                }
                dp[i] += dp[i-c]
            }
        }
        return dp[target]
    }
}
