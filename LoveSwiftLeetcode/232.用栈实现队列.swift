/*
 * @lc app=leetcode.cn id=232 lang=swift
 *
 * [232] 用栈实现队列
 */

// @lc code=start

class MyQueue {
    var stackIn = [Int]()
    var stackOut = [Int]()

    init() { }
    
    func push(_ x: Int) {
        stackIn.append(x)
    }
    
    func pop() -> Int {
        if stackOut.isEmpty {
            while !stackIn.isEmpty {
                stackOut.append(stackIn.popLast()!)
            }
        }
        return stackOut.popLast() ?? -1
    }
    
    func peek() -> Int {
        let res = pop()
        if res != -1 {
            stackOut.append(res)
        }
        return res
    }
    
    func empty() -> Bool {
        return stackIn.isEmpty && stackOut.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
// @lc code=end

