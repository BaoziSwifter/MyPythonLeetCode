//
//  Node.swift
//  StudyLeetcodeProject
//
//  Created by beliefduan on 2022/8/24.
//

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
      public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}
