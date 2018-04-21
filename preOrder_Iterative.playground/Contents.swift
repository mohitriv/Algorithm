
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
    
    func preOrderTraversal(_ root: TreeNode?) {
        var stack = [TreeNode]()
        stack.append(root!)
        while stack.count > 0 {
            // pop
            let last = stack.removeLast()
            print(last.val)
            if let right = last.right {
                stack.append(right)
            }
            if let left = last.left {
                stack.append(left)
            }
        }
    }
}

func creator() {
    let root = TreeNode(1)
    root.left = TreeNode(0)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    Solution().preOrderTraversal(root)
    
}

creator()

