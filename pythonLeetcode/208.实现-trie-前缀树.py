#
# @lc app=leetcode.cn id=208 lang=python
#
# [208] 实现 Trie (前缀树)
#
# https://leetcode-cn.com/problems/implement-trie-prefix-tree/description/
#
# algorithms
# Medium (62.39%)
# Likes:    163
# Dislikes: 0
# Total Accepted:    18.6K
# Total Submissions: 29.4K
# Testcase Example:  '["Trie","insert","search","search","startsWith","insert","search"]\n' +
  '[[],["apple"],["apple"],["app"],["app"],["app"],["app"]]'
#
# 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。
# 
# 示例:
# 
# Trie trie = new Trie();
# 
# trie.insert("apple");
# trie.search("apple");   // 返回 true
# trie.search("app");     // 返回 false
# trie.startsWith("app"); // 返回 true
# trie.insert("app");   
# trie.search("app");     // 返回 true
# 
# 说明:
# 
# 
# 你可以假设所有的输入都是由小写字母 a-z 构成的。
# 保证所有输入均为非空字符串。
# 
# 
#

# @lc code=start

# 15/15 cases passed (136 ms)
# Your runtime beats 79.7 % of python submissions
# Your memory usage beats 57.01 % of python submissions (27.8 MB)
class Trie(object):

    def __init__(self):
        self.root = {}


    def insert(self, word):
        tmpTrie = self.root
        for itemChar in word:
            if itemChar not in tmpTrie:
                tmpTrie[itemChar] = {}
            tmpTrie = tmpTrie[itemChar]
        tmpTrie['#'] = '#'

        

    def search(self, word):
        tmpTrie = self.root
        for itemChar in word:
            if itemChar not in tmpTrie:
                return False 
            tmpTrie = tmpTrie[itemChar]
        if '#' in tmpTrie:
            return True
        return False        

    def startsWith(self, prefix):
        tmpTrie = self.root
        for itemChar in prefix:
            if itemChar not in tmpTrie:
                return False 
            tmpTrie = tmpTrie[itemChar]

            
        return True

# @lc code=end

