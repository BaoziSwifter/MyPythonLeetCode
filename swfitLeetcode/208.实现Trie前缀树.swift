import Foundation

class Solution_208 {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var word: String = ""
        
    }
    
    class Trie {
        let root: TrieNode
        init() {
            root = TrieNode()
        }
        
        func insert(_ word: String) {
            var cur = root
            for c in word {
                if let childNode = cur.children[c] {
                    cur = childNode
                } else {
                    cur.children[c] = TrieNode()
                    cur = cur.children[c]!
                }
            }
            cur.word = word
        }
        
        func search(_ word: String) -> Bool {
            var cur = root
            for c in word {
                if let childNode = cur.children[c] {
                    cur = childNode
                } else {
                    return false
                }
            }
            return cur.word.isEmpty ? false : true
        }
        
        func startsWith(_ prefix: String) -> Bool {
            var cur = root
            for c in prefix {
                if let childNode = cur.children[c] {
                    cur = childNode
                } else {
                    return false
                }
            }
            return true
        }
    }
}
