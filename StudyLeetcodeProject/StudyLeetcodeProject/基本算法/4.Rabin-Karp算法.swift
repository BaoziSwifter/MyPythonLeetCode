//
//  4.Rabin-Karp算法.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/22.
//

import Foundation


func rabinKarp(_ txt: String, _ pat: String) -> Int {
    let PAT:[Character] = Array(pat)
    let source = Array(txt)
    // 位数
    let L = pat.count
    // 进制（在考虑ASCII 编码）
    let R: Int64 = 256
    // 取一个比较大的素数作为求模的除数
    let Q: Int64 = 1658598167
    var RL: Int64 = 1
    for _ in 1..<L {
        // 计算过程中不断求模，避免溢出
        RL = (RL * R) % Q
    }
    // 计算模式串的hash值，时间O(L)
    var pathHash:Int64 = 0
    for i in 0..<L {
        pathHash = (R * pathHash + PAT[i] - "0") % Q
    }
    
    var windowHash:Int64 = 0
    var left = 0, right = 0
    while right < txt.count {
        // 扩大窗口
        windowHash = ((R * windowHash) % Q + source[right] - "0") % Q
        right += 1
        
        // 当子串长度达到要求时
        if right - left == L {
            if windowHash == pathHash {
                // 当前窗口的子串hash值等于模式匹配的哈希值
                // 还需要进一步确认窗口子串首付真的和模式串相同，避免哈希冲突
                if pat == String(source[left..<right]) {
                    return left
                }
            }
            // 缩小窗口，移除字符
            windowHash = (windowHash - (source[left] - "0") * RL % Q + Q) % Q
            // X % Q == (X + Q) % Q 这是模运算的法则
            // 因为 windowHash - (source[left] * RL) % Q 可能为负数
            // 所以额外再加一个 Q, 保证 windowHash 不为负数
            left += 1
        }
        
    }
    return -1
}
