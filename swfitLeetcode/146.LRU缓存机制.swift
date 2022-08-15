// leetcode 146.LRU缓存机制.swift
class LRUNode {
    var key: Int?
    var value: Int?
    var prev: LRUNode?
    var next: LRUNode?
}

class LRUCache {

    var dic = [Int: LRUNode]()
    var maxCount = 0
    var currentCount = 0
    var headerNode: LRUNode? = nil
    var tailNode: LRUNode? = nil

    init(_ capacity: Int) {
        self.maxCount = capacity
    }

    func get(_ key: Int) -> Int {
        let node = dic[key]

        if node == nil {
            return -1
        }

        self.put(key, node!.value!)
        return node!.value!
    }

    func put(_ key: Int, _ value: Int) {
        var node = dic[key]

        if node == nil {    // 插入值
            node = LRUNode()
            node?.key = key
            node?.value = value

            dic[key] = node

            headerNode?.prev = node

            node?.prev = nil
            node?.next = headerNode

            headerNode = node
            if currentCount == 0 { tailNode = headerNode }
            currentCount += 1

        }else { // 更新值
            node?.value = value
            if node?.key == headerNode?.key { return }

            if node?.key == tailNode?.key {
                tailNode = node?.prev
            }

            node?.next?.prev = node?.prev
            node?.prev?.next = node?.next
            node?.prev = nil
            node?.next = headerNode
            headerNode?.prev = node

            headerNode = node
        }

        while currentCount > maxCount {
            let oldTailNode = tailNode
            tailNode = oldTailNode?.prev

            tailNode?.next = nil
            oldTailNode?.prev = nil
            oldTailNode?.next = nil

            dic.removeValue(forKey: oldTailNode!.key!)
            currentCount -= 1
        }
    }
}


