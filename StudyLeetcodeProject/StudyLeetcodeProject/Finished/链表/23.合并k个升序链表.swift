//
//  Leetcode23.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/5.
//

import Foundation
// [23] 合并K个升序链表

/// 自定义堆
typealias PriorityBlock<T> = (T, T) -> Bool

class PriorityQueue<T> {
    var elements: [T]
    var priorityBlock: PriorityBlock<T>
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
    init(_ block: @escaping PriorityBlock<T>) {
        elements = []
        priorityBlock = block
    }
    public func push(_ num: T) {
        elements.append(num)
        heapifyUp(count - 1)
    }
    
    @discardableResult
    public func poll() -> T? {
        if isEmpty {
            return nil
        }
        elements.swapAt(0, count - 1)
        let element = elements.removeLast()
        heapifDown(0)
        return element
    }
    
    public func peek() -> T? {
        if isEmpty {
            return nil
        }
        return elements.first!
    }
    
    private func heapifyUp(_ i: Int) {
        guard i > 0 else { return }
        let parent = (i - 1) / 2
        if priorityBlock(elements[i], elements[parent]) {
            elements.swapAt(i, parent)
            heapifyUp(parent)
        }
    }
    
    // 将堆顶删除时，我们是将堆顶和数组互换，再移除的，此时堆顶元素需要下沉
    private func heapifDown(_ i: Int) {
        let left = i * 2 + 1
        let right = left + 1
        var p = i
        if left < count && priorityBlock(elements[left], elements[p]) {
            p = left
        }
        if right < count && priorityBlock(elements[right], elements[p]) {
            p = right
        }
        if p != i {
            elements.swapAt(i, p)
            heapifDown(p)
        }
    }
}

class Solution23 {
    // 超时法
    func mergeKListsTimeLimit(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        let dumyNode = ListNode(-1)
        var head = dumyNode
        var index = -1
        while true {
            var tmpMinNode = ListNode(Int.max)
            for i in 0..<lists.count {
                guard let node = lists[i] else {
                    continue
                }
                if tmpMinNode.val > node.val {
                    tmpMinNode = node
                    index = i
                }
            }
            if index == -1 {
                break
            }
            head.next = tmpMinNode
            head = tmpMinNode
            lists[index] = tmpMinNode.next
            
        }
        head.next = nil
        return dumyNode.next

    }
    func merge2Lists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dumyNode = ListNode()
        var h = dumyNode
        var l1 = list1, l2 = list2
        while l1 != nil  && l2 != nil {
            if l1!.val < l2!.val {
                h.next = l1
                l1 = l1?.next
            } else {
                h.next = l2
                l2 = l2?.next
            }
            h = h.next!
        }
        h.next = l1 ?? l2
        return dumyNode.next
    }
    // 一般两两合并法
    func mergeKListsFor(_ lists: [ListNode?]) -> ListNode? {
        var res: ListNode? = nil
        for list in lists {
            res = merge2Lists(res, list)
        }
        return res
    }
    // 分治法 递归
    func mergeKListsFor2(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        if lists.count == 1{
            return lists[0]
        }
        let mid = lists.count / 2
        let left = mergeKListsFor2(Array(lists[0..<mid]))
        let right = mergeKListsFor2(Array(lists[mid..<lists.count]))
        return merge2Lists(left, right)
    }
    // 优先队列
    func mergeKListsFor3(_ lists: [ListNode?]) -> ListNode? {
        let priorityQueue = PriorityQueue<ListNode> { $0.val <= $1.val}
        for node in lists {
            guard let node = node else {
                continue
            }
            priorityQueue.push(node)
        }
        let head = ListNode()
        var tail = head
        
        while !priorityQueue.isEmpty {
            let element = priorityQueue.poll()!
            tail.next = element
            tail = tail.next!
            guard let next = element.next else {
                continue
            }
            priorityQueue.push(next)
        }
        return head.next
    }
}
