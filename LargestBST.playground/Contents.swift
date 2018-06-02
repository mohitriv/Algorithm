import UIKit
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

struct TreeWrapper {
    var isBST: Bool = false
    var size: Int = 0
    var min: Int = Int(MINBUCKET)
    var max: Int = Int(MAX_INPUT)
}

class Solution {
    
    func largestBST(root: TreeNode?) -> TreeWrapper? {
        
        if root == nil {
            return nil
        }
        
        let left = largestBST(root: root?.left)
        let right = largestBST(root: root?.right)
        
        if left != nil && right != nil {
            if left?.isBST == true && right?.isBST == true {
                if (root?.val)! > (left?.max)! && (root?.val)! < (right?.min)! {
                    let size = (left?.size ?? 0) + (right?.size ?? 0) + 1
                    let treeWrapper = TreeWrapper(isBST: true, size: size, min: (left?.min)!, max: (right?.max)!)
                    return treeWrapper
                } else {
                    return TreeWrapper(isBST: false, size: max(left?.size ?? 0, right?.size ?? 0), min: 0, max: 0)
                }
            } else {
                return TreeWrapper(isBST: false, size: max(left?.size ?? 0, right?.size ?? 0), min: 0, max: 0)
            }
        } else if left == nil && right == nil {
            return TreeWrapper(isBST: true, size: 1, min: (root?.val)!, max: (root?.val)!)
        } else {
            if left != nil && left?.isBST == true && (root?.val)! > (left?.max)! {
                return TreeWrapper(isBST: true, size: (left?.size ?? 0) + 1, min: (left?.min)!, max: (root?.val)!)
            } else if right != nil && right?.isBST == true && (root?.val)! < (right?.min)! {
                return TreeWrapper(isBST: true, size: (right?.size ?? 0) + 1, min: (root?.val)!, max: (right?.max)!)
            } else {
                return TreeWrapper(isBST: true, size: max(left?.size ?? 0, right?.size ?? 0), min: 0, max: 0)
            }
        }
    }
    
}

func creator() {
    
    let tree1 = getTree()
    let tree2 = getSubTree()
    
    print(Solution().largestBST(root: tree1)?.size)
}

func getTree() -> TreeNode? {
    let root = TreeNode(1)
    root.left = TreeNode(-5)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    root.left?.left = TreeNode(-15)
    root.left?.right = TreeNode(-2)
    
    return root
}

func getSubTree() -> TreeNode? {
    let root = TreeNode(48)
    root.left = TreeNode(12)
    root.right = TreeNode(5)
    
    return root
}

creator()
