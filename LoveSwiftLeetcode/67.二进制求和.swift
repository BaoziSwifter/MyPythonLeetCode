/*
 * @lc app=leetcode.cn id=67 lang=swift
 *
 * [67] 二进制求和
 */

// @lc code=start
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a.reversed()), b = Array(b.reversed())
        var s = "", ci = 0
        for i in 0..<max(a.count, b.count) {
            let va = (i<a.count) ? Int(String(a[i]))! : 0,
                vb = (i<b.count) ? Int(String(b[i]))! : 0,
                sum = va+vb+ci
            s += String(sum&1)
            ci = sum>>1
        }
        s += (ci==0) ? "" : "1"

        return String(s.reversed())
    }
}
// @lc code=end

