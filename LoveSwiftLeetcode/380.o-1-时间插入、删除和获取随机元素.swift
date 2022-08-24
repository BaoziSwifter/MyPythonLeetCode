/*
 * @lc app=leetcode.cn id=380 lang=swift
 *
 * [380] O(1) 时间插入、删除和获取随机元素
 */

// @lc code=start

class RandomizedSet {
    fileprivate var allValueMap = [Int: Int]()
    fileprivate var allValues = [Int]()
    init() {

    }
    
    func insert(_ val: Int) -> Bool {
        if let _ = allValueMap[val] {
            return false
        }
        allValueMap[val] = allValues.count
        allValues.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if let index = allValueMap[val] {
            (allValues[index], allValues[allValues.count - 1]) = (allValues[allValues.count - 1], allValues[index]) 
            allValueMap[allValues[index]] = index
            allValues.removeLast()
            allValueMap.removeValue(forKey: val)
            return true
        }
        return false
    }
    
    func getRandom() -> Int {
        let index = Int.random(in: 0..<allValues.count)
        return allValues[index]
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
// @lc code=end

