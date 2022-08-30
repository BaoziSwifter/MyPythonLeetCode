//
//  LinkedNode.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/30.
//

import Foundation


class LinkedNode {
    public var key: String = ""
    public var val: Int = 0
    public var next: LinkedNode?
    public var prev: LinkedNode?
    public init(_ key: String, _ val: Int) {
        self.key = key
        self.val = val
    }
}


