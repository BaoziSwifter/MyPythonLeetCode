import Foundation

class Solution_offer_27 {
     public class TreeNode {
         public var val: Int
         public var left: TreeNode?
         public var right: TreeNode?
         public init(_ val: Int) {
             self.val = val
             self.left = nil
             self.right = nil
         }
     }
    
    // dsf
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        let right = mirrorTree(root.right)
        let left = mirrorTree(root.left)
        root.left = right
        root.right = left
        return root
        
    }
    
    // bsf
    func mirrorTree_bsf(_ root: TreeNode?) -> TreeNode? {
    
        var list = [TreeNode?]()
        list.append(root)
        while list.count > 0 {
            let node = list.removeLast()
            var t_left :TreeNode? = nil
            var t_right :TreeNode? = nil

            if let left = node?.left {
                list.append(left)
                t_left = left
            }
            if let right = node?.right {
                list.append(right)
                t_right = right
            }
            node?.left = t_right
            node?.left = t_left
        }
        return root
    }
}
