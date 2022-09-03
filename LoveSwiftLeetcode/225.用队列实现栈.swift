/*
 * @lc app=leetcode.cn id=225 lang=swift
 *
 * [225] 用队列实现栈
 */

// @lc code=start

class MyQueue255 {
    var array: [Int]
    init() {
        array = [Int]()
    }
    func push(_ x: Int) {
        array.append(x)
    }
    func pop() -> Int {
        if array.isEmpty {
            return -1
        }
        return array.removeFirst()
    }
    
    func peek() -> Int {
        if array.isEmpty {
            return -1
        }
        return array.first!
    }
    
    func empty() -> Bool {
        return array.isEmpty
    }
    
    func count() -> Int {
        return array.count
    }
}

// 使用双队列
class MyStack {
    var queue1: MyQueue255
    var queue2: MyQueue255
    init() {
        queue1 = MyQueue255()
        queue2 = MyQueue255()
    }
    
    func push(_ x: Int) {
        queue1.push(x)
    }
    
    func pop() -> Int {
        if queue1.empty() {
            return -1
        }
        while queue1.count() > 1 {
            queue2.push(queue1.pop())
        }
        
        let res = queue1.pop()
        while !queue2.empty() {
            queue1.push(queue2.pop())
        }
        return res
    }
    
    func top() -> Int {
        if queue1.empty() {
            return -1
        }
        let res = pop()
        push(res)
        return res
    }
    
    func empty() -> Bool {
        return queue1.empty() && queue2.empty()
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
// @lc code=end

