#
# @lc app=leetcode.cn id=146 lang=python
#
# [146] LRU缓存机制
#
# https://leetcode-cn.com/problems/lru-cache/description/
#
# algorithms
# Medium (44.31%)
# Likes:    353
# Dislikes: 0
# Total Accepted:    28.1K
# Total Submissions: 62.6K
# Testcase Example:  '["LRUCache","put","put","get","put","get","put","get","get","get"]\n' +
  '[[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]'
#
# 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。
# 
# 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
# 写入数据 put(key, value) -
# 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最近最少使用的数据值，从而为新的数据值留出空间。
# 
# 进阶:
# 
# 你是否可以在 O(1) 时间复杂度内完成这两种操作？
# 
# 示例:
# 
# LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );
# 
# cache.put(1, 1);
# cache.put(2, 2);
# cache.get(1);       // 返回  1
# cache.put(3, 3);    // 该操作会使得密钥 2 作废
# cache.get(2);       // 返回 -1 (未找到)
# cache.put(4, 4);    // 该操作会使得密钥 1 作废
# cache.get(1);       // 返回 -1 (未找到)
# cache.get(3);       // 返回  3
# cache.get(4);       // 返回  4
# 
# 
#

@lc code=start
# 18/18 cases passed (296 ms)
# Your runtime beats 42.06 % of python submissions
# Your memory usage beats 5.1 % of python submissions (22.2 MB)
class ListNode:
    def __init__(self, key=None, value=None):
        self.key = key
        self.value = value
        self.prev = None
        self.next = None

class LRUCache1(object):

    def __init__(self, capacity):
        self.capacity = max(1,capacity)
        self.head = ListNode()
        self.tail = ListNode()
        self.head.next = self.tail
        self.tail.prev = self.head

        self.hashmap = {}

    def moveto_front(self,key,value):
        res = self.hashmap.get(key,-1)

        if res == -1:
            return
        else:
            if value: 
                res.value = value
            if res == self.head.next:
                return
            
            prev = res.prev
            next = res.next

            prev.next = next
            next.prev = prev

            res.next = self.head.next
            self.head.next.prev = res

            self.head.next = res
            res.prev = self.head


    def add_to_front(self,key,value):        
        if len(self.hashmap) == self.capacity:
            self.hashmap.pop(self.tail.prev.key)

            realTail = self.tail.prev
            self.tail.prev = realTail.prev
            realTail.prev.next = self.tail

            realTail.next = None
            realTail.prev = None
            

        addNode = ListNode(key, value)

        addNode.next = self.head.next
        self.head.next.prev = addNode
        
        self.head.next = addNode
        addNode.prev = self.head
        
        self.hashmap[key] = addNode

    def get(self, key):
        if key in self.hashmap:
            self.moveto_front(key,None)
        res = self.hashmap.get(key,-1)
        if res == -1:
            return -1
        else:
            return res.value
        

    def put(self, key, value):
        if key in self.hashmap:
            self.moveto_front(key,value)
        else:
            self.add_to_front(key,value)



# 18/18 cases passed (344 ms)
# Your runtime beats 35.28 % of python submissions
# Your memory usage beats 19.39 % of python submissions (21.3 MB)
# from collections import OrderedDict
class LRUCache(object):
  
    def __init__(self, capacity):
        """
        :type capacity: int
        """
        self.capacity = capacity
        self.d = OrderedDict()


    def get(self, key):
        """
        :type key: int
        :rtype: int
        """

        if key in self.d:
            value = self.d[key]
            del self.d[key]
            self.d[key] = value
            return value
        
        return -1


    def put(self, key, value):
        """
        :type key: int
        :type value: int
        :rtype: None
        """
        if key in self.d:
            del self.d[key]
        
        else:
            if len(self.d) ==self.capacity:
                self.d.popitem(False)
        self.d[key] = value 

        


# @lc code=end

