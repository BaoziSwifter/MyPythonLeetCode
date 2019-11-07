"""
设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。

push(x) -- 将元素 x 推入栈中。
pop() -- 删除栈顶的元素。
top() -- 获取栈顶元素。
getMin() -- 检索栈中的最小元素。
示例:

MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.getMin();   --> 返回 -2.
"""

class MinStack:

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.mystack = []
        self.minValue = None
        

    def push(self, x):
        """
        :type x: int
        :rtype: void
        """
        self.mystack.append(x)
        if self.minValue == None or self.minValue > x:
            self.minValue = x

        

    def pop(self):
        """
        :rtype: void
        """
        popItem = self.mystack.pop()
        if len(self.mystack) == 0:
            self.minValue = None
            return popItem
        
        if popItem == self.minValue:
            self.minValue = self.mystack[0]
            for v in self.mystack:
                if v < self.minValue:
                    self.minValue = v
        return popItem
        

    def top(self):
        """
        :rtype: int
        """
        return self.mystack[-1]
        

    def getMin(self):
        """
        :rtype: int
        """
        return self.minValue