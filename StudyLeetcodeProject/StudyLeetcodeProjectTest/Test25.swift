//
//  Test25.swift
//  StudyLeetcodeProjectTest
//
//  Created by beliefduan on 2022/8/19.
//

import XCTest

class Test25: XCTestCase {
    func buildListNode(_ array: [Int]) -> ListNode? {
        let dumyNode = ListNode()
        var pre: ListNode = dumyNode
        for i in array {
            let tmp = ListNode(i)
            pre.next = tmp
            pre = tmp
        }
        return dumyNode.next
    }
    
    func compareListNode(_ h1:ListNode?, _ h2:ListNode?) -> Bool {
        var h1 = h1
        var h2 = h2
        while h1 != nil && h2 != nil {
            if h1?.val == h2?.val {
                h1 = h1?.next
                h2 = h2?.next
            } else {
                break
            }
        }
        if h1 != nil || h2 != nil {
            return false
        }
        return true
    }
    func printListNode(_ head: ListNode?) {
        var res = ""
        var h = head
        while h != nil {
            res += "\(h!.val)->"
            h = h?.next
        }
        res += "nil"
        print(res)
    }

    func testExample() throws {
        let s25 = Solution25()
        let arr1 = [1, 2, 3, 4, 5]
        let resArr = [2, 1, 4, 3, 5]
        let node1 = buildListNode(arr1)
        print("翻转前-----")
        printListNode(node1)
        let resNode = buildListNode(resArr)
        print("check List Nodes ----")
        printListNode(resNode)

        let res = s25.reverseKGroup_while(node1, 2)
        print("翻转后-----")
        printListNode(res)
        XCTAssertTrue(compareListNode(res, resNode))
        
    }


}
