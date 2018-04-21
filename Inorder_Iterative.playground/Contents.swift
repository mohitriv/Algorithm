
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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var stack = [TreeNode]()
        var tempRoot = root
        var minDiff = Int(MAX_INPUT)
        var previousVal: Int? = nil
        while stack.count > 0 || tempRoot != nil {
            if tempRoot == nil {
                // pop top of the stack
                var last = stack.removeLast()
                if let prev = previousVal {
                    minDiff = min(minDiff, last.val-prev)
                }
                previousVal = last.val
                if let right = last.right {
                    tempRoot = right
                }
            } else {
                stack.append(tempRoot!)
                tempRoot = tempRoot?.left
            }
        }
        return minDiff
    }
}


func creator() {
    let root = TreeNode(1)
    root.left = TreeNode(0)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    Solution().minDiffInBST(root)
    
}

 creator()
