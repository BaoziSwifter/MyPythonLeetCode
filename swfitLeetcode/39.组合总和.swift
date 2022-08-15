import Foundation

class Solution_39 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        func dfs(_ candidates:[Int], _ target: Int, _ begin: Int, _ path: [Int],_ res: inout [[Int]]) {
            if target == 0 {
                res.append(path)
                return
            }
            for i in begin ..< candidates.count {
                let v = candidates[i]
                if target - v < 0 {
                    break
                }
                var path = path
                path.append(v)
                dfs(candidates, target-v, i, path, &res)
                path.removeAll()
            }
        }
        
        var res = [[Int]]()
        
        if candidates.count == 0 {
            return res
        }
        
        let path = [Int]()
        let newCandidates = candidates.sorted()
        dfs(newCandidates, target,0, path, &res)
        return res
    }
    
    func combinationSum_2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var tmp = [Int]()
        if candidates.count == 0 {
            return []
        }
        let candidates = candidates.sorted()
        func BFS(_ index: Int, _ ans: Int) {
            if index >= candidates.count {
                return
            }
            if ans == target {
                res.append(tmp)
                return
            }
            let v = candidates[index]

            if ans+v > target {
                return
            }
            tmp.append(v)
            BFS(index, ans+v)
            tmp.removeLast()
            BFS(index+1, ans)
            
        }
        BFS(0,0)
        return res
    }
}
