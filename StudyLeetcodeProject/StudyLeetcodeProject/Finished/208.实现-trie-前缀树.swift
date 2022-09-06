//
//  208.-实现-trie-前缀树.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/16.
//

import Foundation

class Trie208 {
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
