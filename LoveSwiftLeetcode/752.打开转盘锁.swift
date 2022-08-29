/*
 * @lc app=leetcode.cn id=752 lang=swift
 *
 * [752] 打开转盘锁
 */

// @lc code=start
class Solution {
    func plus(_ s: String, _ j: Int) -> String {
        var ch:[Character] = Array(s)
        if ch[j] == "9" {
            ch[j] = "0"
        } else {
            let v = ch[j].asciiValue! + 1
            let c = Character(UnicodeScalar(v))
            ch[j] = c
        }
        return String(ch)
        
    }
    
    func minus(_ s: String, _ j: Int) -> String {
       var ch:[Character] = Array(s)
        if ch[j] == "0" {
            ch[j] = "9"
        } else {
            ch[j] = Character(UnicodeScalar(ch[j].asciiValue! - 1))
        }
        return String(ch)
    }
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var q = [String]()
        q.append("0000")
        var step = 0
        var visited = Set<String>()
        visited.insert("0000")
        var deads = Set<String>()
        for s in deadends {
            deads.insert(s)
        }
        while q.isEmpty == false {
            let sz = q.count
            var tmpQ = [String]()
            for i in 0..<sz {
                let cur = q[i]
                if deads.contains(cur) {
                    continue
                }
                
                if cur == target {
                    return step
                }
                for j in 0 ..< 4 {
                    let up = plus(cur, j)
                    if !visited.contains(up) {
                        tmpQ.append(up)
                        visited.insert(up)
                    }
                    let down = minus(cur, j)
                    if !visited.contains(down) {
                        tmpQ.append(down)
                        visited.insert(down)
                    }
                }
            }
            q = tmpQ
            step += 1
        }
        return -1
    }
}
// @lc code=end

