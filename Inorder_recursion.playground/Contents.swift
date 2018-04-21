
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
    var minDiff = Int(MAX_INPUT)
    var previousVal: Int?
    func inOrderTraversal(_ root: TreeNode?) {
        if root == nil { return }
        inOrderTraversal(root?.left)
        print(root!.val)
        inOrderTraversal(root?.right)
    }
}

func creator() {
    let root = TreeNode(1)
    root.left = TreeNode(0)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    Solution().inOrderTraversal(root)
    
}

 creator()
