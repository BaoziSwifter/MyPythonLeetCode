import Foundation

class Solution_557 {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").map { String($0.reversed()) }.joined(separator: " ")
    }
    
    func reverseWords_for(_ s: String) -> String {
        var charts = [Character]()
        
        var index = 0
        for (i, v) in s.enumerated() {
            if v != " " {
                charts.insert(v, at: index)
            } else {
                charts.append(v)
                index = i + 1
            }
        }
        return String(charts)
    }
    
    func reverseWords_on(_ s: String) -> String {
        var result = ""
        var tmp = ""
        var index = s.endIndex
        while index != s.startIndex {
            index = s.index(before: index)
            if s[index] == " " {
                result = "\(tmp) \(result)"
                tmp = ""
            } else {
                tmp.append(s[index])
            }
        }
        result = "\(tmp) \(result)"
        result.removeLast()
        return result
    }
}
