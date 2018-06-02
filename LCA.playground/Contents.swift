
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
    func lca(root: TreeNode?, node1: TreeNode, node2: TreeNode) -> TreeNode? {
        if root == nil {
            return nil
        }
        if root?.val == node1.val || root?.val == node2.val {
            return root!
        }
        
        let leftLCA = lca(root: root?.left, node1: node1, node2: node2)
        let rightLCA = lca(root: root?.right, node1: node1, node2: node2)
        
        if leftLCA != nil && rightLCA != nil {
            return root
        } else if leftLCA == nil && rightLCA == nil {
            return nil
        } else {
            return leftLCA != nil ? leftLCA : rightLCA
        }
    }
}

func creator() {
    
    let root = TreeNode(1)
    root.left = TreeNode(10)
    root.right = TreeNode(48)
    
    root.right?.left = TreeNode(12)
    root.right?.right = TreeNode(49)
    
    root.left?.left = TreeNode(15)
    root.left?.right = TreeNode(5)
    
    let node = Solution().lca(root: root, node1: (root.right?.left)!, node2: (root.right?.right)!)
    print((node?.val)!)
}

creator()
