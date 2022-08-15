class MergeSections {
    func removeCoverdIntervals(intvs :[[Int]]) -> Int {
        let intVS = intvs.sorted{ (a, b) -> Bool in
            if a[0] == b[0] {
                return b[1] - a[1] > 0
            }
            return a[0] - b[0] > 0
        }
        var res = 0
        var left = intVS[0][0], right = intVS[0][1]
        for i in 1..<intvs.count {
            let intv = intVS[i]
            if left <= intv[0] && right >= intv[1] {
                res += 1
            }

            if right >= intv[0] && right <= intv[1] {
                right = intv[1]
            }

            if right < intv[0] {
                left = intv[0]
                right = intv[1]
            }
        }
        return intvs.count - res

    }

}
