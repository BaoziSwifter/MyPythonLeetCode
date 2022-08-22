//
//  76.最小覆盖子串.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/22.
//

import Foundation


class Solution76 {
    func minWindow(_ s: String, _ t: String) -> String {
        let source = [Character](s)
        // 窗口字典
        var window = [Character: Int]()
        // 存储所需字符数量的字典
        var needTarget = [Character: Int]()
        for c in t {
           needTarget[c, default: 0] += 1
        }
        var left = 0, right = 0
        // 记录匹配的次数 等于needTarget的key数量时代表已经匹配完成
        var matchCnt = 0
        var start = 0, end = 0
        var minLen = Int.max
        while right < source.count {
            let a = source[right]
            right += 1
            // 右端点字符不是所有需的字符串时直接跳过
            if needTarget[a] == nil { continue }
            // 窗口中对应的字符数量+1
            window[a, default: 0] += 1
            // 窗口中字数数量达到所需要匹配的数量时，匹配数+1
            if window[a] == needTarget[a] {
                matchCnt += 1
            }
            
            // 判断匹配是否完成，开始移动窗口左侧端点，目的是为了找到当前窗口的最小长度
            while matchCnt == needTarget.count {
                // 记录最小范围
                if right - left < minLen {
                    start = left
                    end = right
                    minLen = right - left
                }
                let d = source[left]
                left += 1
                if needTarget[d] == nil { continue }
                // 如果当前左端字符的窗口中数量和所需要数量相等，则后续一定就不满足匹配了，匹配数-1
                if needTarget[d] == window[d] {
                    matchCnt -= 1
                }
                // 减少窗口字典中对应字符的数量
                window[d]! -= 1
            }
        }
        return minLen == Int.max ? "" : String(source[start..<end])
    }
}
