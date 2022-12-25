//
//  131.-分割回文串.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Solution131 {
    // 深度优先
    func partition_dfs(_ s: String) -> [[String]] {
        let n = s.count
        let fi = [Bool](repeating: true, count: n)
        var dp = [[Bool]](repeating: fi, count: n)
        // 动态规划 判断回文
        for i in stride(from: n - 1, to: -1, by: -1) {
            for j in i + 1 ..< n {
                let si = s[s.index(s.startIndex, offsetBy: i)]
                let sj = s[s.index(s.startIndex, offsetBy: j)]
                dp[i][j] = (si == sj && dp[i + 1][j - 1])
            }
        }
        var res = [[String]]()
        var splits = [String]()
        //  深度优先
        func dfs(_ i : Int) {
            if i == n {
                res.append(splits)
                return
            }
            for j in i ..< n {
                if dp[i][j] {
                    let startIndex = s.index(s.startIndex, offsetBy: i)
                    let endIndex = s.index(s.startIndex, offsetBy: j + 1)
                    splits.append(String(s[startIndex ..< endIndex]))
                    dfs(j + 1)
                    let _ = splits.popLast()
                }
            }
        }
        dfs(0)
        return res
    }
    //
    func partition_backtrack(_ s: String) -> [[String]] {
        let n = s.count
        let fi = [Bool](repeating: true, count: n)
        var dp = [[Bool]](repeating: fi, count: n)
        // 动态规划 判断回文
        for i in stride(from: n - 1, to: -1, by: -1) {
            for j in i + 1 ..< n {
                let si = s[s.index(s.startIndex, offsetBy: i)]
                let sj = s[s.index(s.startIndex, offsetBy: j)]
                dp[i][j] = (si == sj && dp[i + 1][j - 1])
            }
        }
        let list = Array(s)
        var res = [[String]]()
        var itemList = [String]()
        func backtrack(_ start: Int) {
            if start >= n {
                res.append(itemList)
                return
            }
            for i in start ..< n {
                // 动态规划判断回文
                if !dp[start][i] { continue }
                // 是回文
                let item = Array(list[start...i])
                itemList.append(String(item))
                backtrack(start + 1)
                itemList.removeLast()
            }
        }
        backtrack(0)
        return res
        
    }
}
