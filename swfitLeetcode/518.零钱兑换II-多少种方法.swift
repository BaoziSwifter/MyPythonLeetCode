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

    func goodCollectionMoey(coins: [Int], target: Int) -> Int {
        if target < 0 {
            return -1
        }
        if target == 0 {
            return 0
        }
        var dp = [Int](repeating: 0, count: target+1)
        dp[1] = 1

        for i in 1...target {
            for c in coins {
                guard i - c >= 0 else{
                    continue
                }
                dp[i] = min(dp[i], 1+dp[i-c])
            }
        }
        return dp[target]
    }
}
