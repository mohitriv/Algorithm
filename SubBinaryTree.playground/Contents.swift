
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
    func isSubBinaryTree(root1: TreeNode?, root2: TreeNode?) -> Bool {
        if root1 == nil {
            if root2 == nil {
                return true
            } else {
                return false
            }
        }
        return isSame(root1: root1, root2: root2) || isSubBinaryTree(root1: root1?.left, root2: root2) || isSubBinaryTree(root1: root1?.right, root2: root2)
    }
    
    func isSame(root1: TreeNode?, root2: TreeNode?) -> Bool {
        if root1 != nil && root2 != nil {
            return root1?.val == root2?.val && isSame(root1: root1?.left, root2: root2?.left) && isSame(root1: root1?.right, root2: root2?.right)
        } else if root1 == nil && root2 == nil {
            return true
        }
        return false
    }
}

func creator() {
    
    let tree1 = getTree()
    let tree2 = getSubTree()
    
    print(Solution().isSubBinaryTree(root1: tree1, root2: tree2))
}

func getTree() -> TreeNode? {
    let root = TreeNode(1)
    root.left = TreeNode(10)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    root.left?.left = TreeNode(15)
    root.left?.right = TreeNode(5)
    
    return root
}

func getSubTree() -> TreeNode? {
    let root = TreeNode(48)
    root.left = TreeNode(12)
    root.right = TreeNode(5)
    
    return root
}

creator()
