
import Foundation

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

class Solution {
    func leafToLeafMax(root: TreeNode?, result: inout Int) -> Int {
        if root == nil {
            return 0
        }
        let leftMax = leafToLeafMax(root: root?.left, result: &result)
        let rightMax = leafToLeafMax(root: root?.right, result: &result)
        let maxLocalPath = leftMax + rightMax + 1
        let nodeMax = max(leftMax, rightMax) + 1
        result = max(result, maxLocalPath)
        return nodeMax
    }
    
    func maxPath(root: TreeNode?) -> Int {
        var result = 0
        _ = leafToLeafMax(root: root, result: &result)
        return result
    }
}


func creator() {
    
    let tree1 = getTree()
    
    print(Solution().maxPath(root: tree1))
}

func getTree() -> TreeNode? {
    let root = TreeNode(1)
    root.left = TreeNode(10)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    root.left?.left = TreeNode(15)
    root.left?.right = TreeNode(5)
    
    root.left?.right?.right = TreeNode(5)
    root.left?.right?.right?.right = TreeNode(5)
    
    return root
}

creator()
