/*
 * @lc app=leetcode.cn id=155 lang=swift
 *
 * [155] 最小栈
 */

// @lc code=start

class MinStack {
    var stack = [Int]()
    var minStack = [Int.max]
    init() {

    }
    
    func push(_ val: Int) {
        stack.append(val)
        let cnt = minStack.count
        minStack.append(min(minStack[cnt - 1], val))
    }
    
    func pop() {
        if !stack.isEmpty {
            let _ = stack.popLast()
            let _ = minStack.popLast()
        }
    }
    
    func top() -> Int {
        if stack.isEmpty == false {
            return stack.last!
        }
        return -1
    }
    
    func getMin() -> Int {
        if stack.isEmpty == false {
            return minStack.last!
        }
        return -1
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
// @lc code=end

