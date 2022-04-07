//
//  110.平衡二叉树.swift
//  ZMathCode
//
//  Created by QZD on 2022/3/24.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：true
 示例 2：


 输入：root = [1,2,2,3,3,null,null,4,4]
 输出：false
 示例 3：

 输入：root = []
 输出：true
  

 提示：

 树中的节点数在范围 [0, 5000] 内
 -104 <= Node.val <= 104

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/balanced-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree5 = TreeNode.init(7, nil, nil)
 let tree4 = TreeNode.init(15, nil, nil)
 let tree3 = TreeNode.init(20, tree4, tree5)
 let tree2 = TreeNode.init(9, nil, nil)
 let tree1 = TreeNode.init(3, tree2, tree3)
 print(isBalanced(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    
    func p_help(node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        
        let leftH = p_help(node: node?.left)
        let rightH = p_help(node: node?.right)
        
        //后序遍历, 判断本层是否是平衡
        if leftH == -1 || rightH == -1 || abs(leftH - rightH) > 1 {
            return -1
        }
        return max(leftH, rightH) + 1
    }
    
    return p_help(node: root) >= 0
}
