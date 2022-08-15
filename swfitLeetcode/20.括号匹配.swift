import Foundation

class Solution_20 {
    func isValid(_ s:String) -> Bool {
        let od = s.count % 2
        if od == 1 {
            return false
        }
        var tmpArr = [Character]()
        for c in s {
            switch c {
            case "(","{","[":
                tmpArr.append(c)
            
            case ")" :
                if tmpArr.popLast() != "(" {
                    return false
                }
            case "}":
            if tmpArr.popLast() != "{" {
                return false
            }
            case "]":
            if tmpArr.popLast() != "[" {
                return false
            }
            default:
                return false
            }
        }
        return (tmpArr.count == 0)
        
    }
    
    
}
