class MergeSectionSolution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intvs = intervals.sorted{ (a, b) -> Bool in
            if a[0] == b [0] {
                return a[1] < b[1]
            }
            return a[0] < b[0]
        }
        print(intvs)
        var res = [[Int]]()
        var left = intvs[0][0] , right = intvs[0][1]
        for i in 1..<intvs.count {
            if left <= intvs[i][0] && intvs[i][0] <= right {
                if intvs[i][1] >= right {
                    right = intvs[i][1]
                }
            } else {
                res.append([left, right])
                left = intvs[i][0]
                right = intvs[i][1]
            }
        }
        res.append([left, right])
        return res
    }
}
