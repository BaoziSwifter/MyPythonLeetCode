//
//  239.滑动窗口最大值.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/9/3.
//

import Foundation


// 节点类
class Node239 {
    // 节点的值
    var value : Int

    // 前节点和后节点
    var prev : Node239?, next : Node239?

    init() {
        self.value = 0
        self.prev = nil
        self.next = nil
    }

    init(_ value : Int) {
        self.value = value
        self.prev = nil
        self.next = nil
    }
}

// 双链表类
class DoubleLink239 {
    // 伪头部节点和伪尾部节点
    private var _head : Node239, _tail : Node239

    // 链表元素数
    private var _count : Int

    // 初始化双向链表的数据
    init() {
        _head = Node239()
        _tail = Node239()
        _count = 0

        _head.next = _tail

        _tail.prev = _head
    }

    // 在链表第一个位置添加节点 node，时间 O(1)。
    func addToFirst(_ node : Node239) {
        node.prev = _head
        node.next = _head.next
        _head.next?.prev = node
        _head.next = node
        _count += 1
    }

    // 在链表最后一个位置添加节点 node，时间 O(1)。
    func addToLast(_ node : Node239) {
        node.prev = _tail.prev
        node.next = _tail
        _tail.prev?.next = node
        _tail.prev = node
        _count += 1
    }

    // 删除链表中的 node 节点，时间 O(1)。
    func removeNode(_ node : Node239) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
        _count -= 1
    }

    // 把链表中的 node 节点移动到第一个位置，时间 O(1)。
    func moveToFirst(_ node : Node239) {
        removeNode(node)
        addToFirst(node)
    }

    
    // 把链表中的 node 节点移动到最后一个位置，时间 O(1)。
    func moveToLast(_ node : Node239) {
        removeNode(node)
        addToLast(node)
    }

    // 删除链表中第一个位置的节点，并返回该节点，时间 O(1)。
    func removeFirst() -> Node239? {
        guard let node = _head.next else { return nil }
        removeNode(node)
        return node
    }

    // 删除链表中最后一个位置的节点，并返回该节点，时间 O(1)。
    func removeLast() -> Node239? {
        guard let node = _tail.prev else { return nil }
        removeNode(node)
        return node
    }
    
    // 链表中第一个位置的节点
    var firstNode : Node239? {
        if _count == 0 { return nil }
        return _head.next
    }

    // 链表中最后一个位置的节点
    var lastNode : Node239? {
        if _count == 0 { return nil }
        return _tail.prev
    }

    // 返回双向链表的元素个数
    var count : Int { _count }

    // 双向链表是否为空
    var isEmpty : Bool { _count == 0 }
}

// 单调队列类
class MonotoneQueue239 {

    // 双向链表，用来实现单调队列
    private var _doubleLink : DoubleLink239

    init() {
        _doubleLink = DoubleLink239()
    }

    // 压入一个元素
    func push(_ value : Int) {
        // 将前面小于 value 的元素都删除
        while !_doubleLink.isEmpty && value > _doubleLink.lastNode!.value {
            _doubleLink.removeLast()
        }
        _doubleLink.addToLast(Node239(value))
    }

    // 弹出一个元素
    func pop(_ value : Int) {
        if value == _doubleLink.firstNode?.value {
            _doubleLink.removeFirst()
        }
    }

    // 队列中的最大值。队列第一位置的元素肯定是最大的。
    var maxValue : Int? { _doubleLink.firstNode?.value }
}


class Solution239 {

    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
            
        // 假装这是滑动窗口
        var window = MonotoneQueue239()

        // 存放最大值的数组
        var result = [Int]()

        // 填满窗口 k 个数字
        for i in 0 ..< k {
            window.push(nums[i])
        }
        
        // 记录当前窗口的最大值
        result.append(window.maxValue!)

        for i in k ..< nums.count {
                // 滑动窗口向右移动一位。即，先移出旧数字 ，再加入新数字。

                // 移出旧数字
                window.pop(nums[i - k]);

                // 加入新数字
                window.push(nums[i]);

                // 记录当前窗口的最大值
                result.append(window.maxValue!);
        }

        return result
    }
}


class Solution239_1 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        //使用优先队列 和 单调队列的方法，
        //此处为单调队列的方式,第0个就是最大的值
        var list = [Int]()
        var ans = [Int]()
        var left = 0
        for right in 0..<nums.count{
            let len = right - left + 1
            while !list.isEmpty && list.last! < nums[right]{
                list.removeLast()
            }
            list.append(nums[right])
            
            if len < k{
                continue
            }
            ans.append(list[0])
            //是否左移掉的最大元素
            if nums[left] == list[0]{
                //list.removeFirst() 这种写法会超时
                list = Array(list[1..<list.count])
            }
            left += 1
        }
        return ans
    }
}


