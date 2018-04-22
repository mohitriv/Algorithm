
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
    
    func postOrderTraversal(_ root: TreeNode?) {
        var current: TreeNode?
        current = root
        var previousVisit: TreeNode?
        var stack = [TreeNode]()
        while current != nil || !stack.isEmpty {
            // push left node
            if current != nil {
                stack.append(current!)
                current = current?.left
            } else {
                if let right = stack.last?.right {
                    // Check right of a top node
                    if let previous = previousVisit {
                        if right.val == previous.val {
                            // visit node
                            previousVisit = stack.removeLast()
                            print((previousVisit?.val)!)
                        } else {
                            current = right
                        }
                    }
                } else {
                    // visit node
                    previousVisit = stack.removeLast()
                    print((previousVisit?.val)!)
                }
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
    
    Solution().postOrderTraversal(root)
    
}

creator()

