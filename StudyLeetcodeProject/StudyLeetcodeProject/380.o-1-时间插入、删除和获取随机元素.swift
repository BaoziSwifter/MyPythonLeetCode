//
//  380.o-1-时间插入、删除和获取随机元素.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

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
