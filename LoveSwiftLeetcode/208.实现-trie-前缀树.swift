/*
 * @lc app=leetcode.cn id=208 lang=swift
 *
 * [208] 实现 Trie (前缀树)
 */

// @lc code=start

class Trie {
    class TrieTreeNode {
        var children: [Character: TrieTreeNode] = [:]
        var isWord = false
    }
    let root = TrieTreeNode()
    init() {

    }
    
    func insert(_ word: String) {
        var cur = root
        for c in word {
            if let cn = cur.children[c] {
                cur = cn
            } else {
                cur.children[c] = TrieTreeNode()
                cur = cur.children[c]!
            }
        }
        cur.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        var cur = root
        for c in word {
            if let cn = cur.children[c] {
                cur = cn
            } else {
                return false
            }
        }
        return cur.isWord
        
    }
    
    func startsWith(_ word: String) -> Bool {
        var cur = root
        for c in word {
            if let cn = cur.children[c] {
                cur = cn
            } else {
                return false
            }
        }
        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
// @lc code=end

