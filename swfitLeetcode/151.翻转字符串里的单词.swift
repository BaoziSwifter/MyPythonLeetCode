import Foundation


/**
 输入：s = "the sky is blue"
 输出："blue is sky the"
 */
class Solution_151 {
    
    func inner_reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
    }
    
    func reverseWords(_ s: String) -> String {
        var res = ""
        var temp = ""
        for c in s {
            if c != " " {
                temp.append(c)
            } else {
                if !temp.isEmpty {
                    if !res.isEmpty {
                        res = "\(String(temp)) \(res)"
                    } else {
                        res = temp
                    }
                    temp = ""
                }
            }
        }
        if !temp.isEmpty {
            if !res.isEmpty {
                res = "\(String(temp)) \(res)"
            } else {
                res = temp
            }
        }
        return res
    }
}
