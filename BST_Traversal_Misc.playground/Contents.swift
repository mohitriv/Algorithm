
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
    
    func getHeight(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(getHeight(root?.left), getHeight(root?.right)) + 1
    }
    
    func getHeightIterative(_ root: TreeNode?) -> Int {
        // Height using level order traversal
        var height = (left: 0, right: 0)
        var queue = [TreeHeightWrapper]()
        queue.append(TreeHeightWrapper(node: root, height: 1))
        while !queue.isEmpty {
            // dequeue
            let nodeWrapper = queue.remove(at: 0)
            // enqueue
            
            if let left = nodeWrapper.node?.left {
                queue.append(TreeHeightWrapper(node: left, height: nodeWrapper.height + 1))
                height.left = nodeWrapper.height + 1
            }
            if let right = nodeWrapper.node?.right {
                queue.append(TreeHeightWrapper(node: right, height: nodeWrapper.height + 1))
                height.right = nodeWrapper.height + 1
            }
        }
        return max(height.left, height.right)
    }
    
    func isSumEqualNumber(_ root: TreeNode?, number: Int) -> Bool {
        if isNodeLeaf(root) {
            if let val = root?.val, number == val {
                return true
            } else {
                return false
            }
        } else {
            return isSumEqualNumber(root?.left, number: number-(root?.val)!) || isSumEqualNumber(root?.right, number: number-(root?.val)!)
        }
    }
    
    func isBinaryTreeBST(_ root: TreeNode?, min: Int, max: Int) -> Bool {
        if let root = root {
            if root.val <= min || root.val > max {
                return false
            }
            return isBinaryTreeBST(root.left, min: min, max: root.val) && isBinaryTreeBST(root.right, min: root.val, max: max)
        } else {
            return true
        }
    }
    
    func isNodeLeaf(_ node: TreeNode?) -> Bool {
        return node?.left == nil && node?.right == nil
    }
}

class TreeHeightWrapper {
    var node: TreeNode?
    var height: Int = 0
    
    init(node: TreeNode?, height: Int) {
        self.node = node
        self.height = height
    }
}

func creator() {
    let root = TreeNode(4)
    root.left = TreeNode(0)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    print(Solution().getHeight(root))
    print(Solution().getHeightIterative(root))
    print(Solution().isSumEqualNumber(root, number: 64))
    print(Solution().isBinaryTreeBST(root, min: Int.min, max: Int.max))
}

creator()

