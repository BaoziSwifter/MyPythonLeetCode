/*
 * @lc app=leetcode.cn id=146 lang=swift
 *
 * [146] LRU 缓存
 */

// @lc code=start

class MyNode {
    var key: Int = 0
    var val: Int = 0
    var prev: MyNode?
    var next: MyNode?
    init(_ key: Int = 0, _ val: Int = 0) {
        self.key = key
        self.val = val
    }
}
class LRUCache {
    var map: [Int: MyNode]!
    var capacity = 0
    var head: MyNode!
    var tail: MyNode!
    init(_ capacity: Int) {
        self.capacity = capacity
        map = [Int: MyNode]()
        head = MyNode()
        tail = MyNode()
        head.next = tail
        tail.prev = head
    }

    private func removeNode(_ node: MyNode) {
        node.next!.prev = node.prev
        node.prev!.next = node.next
    }
    
    private func addAtFirst(_ node: MyNode) {
        node.next = head.next
        head.next!.prev = node
        
        head.next = node
        node.prev = head
    }
    
    func get(_ key: Int) -> Int {
        guard let node = map[key] else {
            return -1
        }
        removeNode(node)
        addAtFirst(node)
        return node.val
    }
    
    func put(_ key: Int, _ val: Int) {
        guard let node = map[key] else {
            if map.keys.count == capacity {
                let preNode = map.removeValue(forKey: tail.prev!.key)!
                removeNode(preNode)
            }
            let newNode = MyNode(key, val)
            map[key] = newNode
            addAtFirst(newNode)
            return
        }
        
        node.val = val
        removeNode(node)
        addAtFirst(node)
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

