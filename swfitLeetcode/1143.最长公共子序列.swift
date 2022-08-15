class LongestCommonSubsequence {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard text2.count <= text1.count else {
                    return longestCommonSubsequence(text2, text1)
                }
        let s1 = Array(text1)
        let s2 = Array(text2)
        var dp = Array(repeating: 0, count: s2.count)

        for i in 0..<s1.count {
            var cur = 0
            for j in 0..<s2.count {
                let next = dp[j]
                if s1[i] == s2[j] {
                    dp[j] = 1+cur
                } else {
                    dp[j] = max(dp[j], j > 0 ? dp[j-1] : 0 )
                }
                cur = next
            }
        }
        return dp.last!

    }
}

