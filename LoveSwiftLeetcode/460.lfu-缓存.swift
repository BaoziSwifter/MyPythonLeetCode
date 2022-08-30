/*
 * @lc app=leetcode.cn id=460 lang=swift
 *
 * [460] LFU 缓存
 */

// @lc code=start


public class CacheNode {
    var next: CacheNode?
    var pre: CacheNode?
    var key: Int
    var time: Int
    var val: Int
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
        self.time = 0
        self.next = nil
        self.pre = nil
    }
}

public class LinkedList {
    var head: CacheNode
    var tail: CacheNode
    var count: Int
    init() {
        self.head = CacheNode(0, 0)
        self.tail = CacheNode(0, 0)
        self.head.next = self.tail
        self.tail.pre = self.head
        self.count = 0
    }
    func insert(_ node: CacheNode) {
        node.next = head.next
        node.pre = head
        head.next?.pre = node
        head.next = node
        count += 1
    }
    
    func delete(_ node: CacheNode) {
        if count == 0 { return }
        node.next?.pre = node.pre
        node.pre?.next = node.next
        count -= 1
    }
    
    func deleteLast() -> Int? {
        if count == 0 { return nil }
        let tmp = tail.pre!
        delete(tmp)
        return tmp.key
    }
}

class LFUCache {
    private var cache: [Int: CacheNode]
    private var timeCache: [Int: LinkedList] // 访问次数与链表映射
    private var miniTime: Int // 最小访问次数
    private var capacity: Int
    private var curNum: Int // 当前缓存的个数
    init(_ capacity: Int) {
        self.cache = [Int: CacheNode]()
        self.timeCache = [Int: LinkedList]()
        self.miniTime = 0
        self.capacity = capacity
        self.curNum = 0
    }
    
    func get(_ key: Int) -> Int {
        if capacity == 0 { return -1 }
        guard let tNode = cache[key] else {
            return -1
        }
        let linkList = timeCache[tNode.time]
        linkList!.delete(tNode)
        if linkList!.count == 0 {
            timeCache.removeValue(forKey: tNode.time)
            if miniTime == tNode.time {
                miniTime += 1
            }
        }
        tNode.time += 1
        var linkList2 = timeCache[tNode.time]
        if linkList2 == nil { linkList2 = LinkedList() }
        linkList2!.insert(tNode)
        timeCache[tNode.time] = linkList2
        cache[key] = tNode
        return tNode.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 { return }
        guard let tNode = cache[key] else {
            let tNode = CacheNode(key, value)
            if curNum < capacity {
                curNum += 1
            } else if curNum == capacity {
                // 缓存已经满
                // 获取最小访问次数
                let linklist = timeCache[miniTime]
                let key = linklist?.deleteLast() // 删除最后一个
                cache.removeValue(forKey: key!)
                if linklist!.count == 0 {
                    miniTime += 1
                }
            }
            // 插入链表
            var linklist = timeCache[tNode.time]
            if linklist == nil { linklist = LinkedList() }
            linklist!.insert(tNode)
            timeCache[tNode.time] = linklist
            miniTime = 0
            cache[key] = tNode
            return
        }
        let linkList = timeCache[tNode.time]
        linkList!.delete(tNode)
        if linkList!.count == 0 {
            timeCache.removeValue(forKey: tNode.time)
            if miniTime == tNode.time {
                miniTime += 1
            }
        }
        tNode.time += 1 // 访问次数+1
        tNode.val = value
        // 插入链表表头
        var linklist2 = timeCache[tNode.time]
        if linklist2 == nil { linklist2 = LinkedList() }
        linklist2!.insert(tNode)
        timeCache[tNode.time] = linklist2
        cache[key] = tNode
    }
}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
// @lc code=end

