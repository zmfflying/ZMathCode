//
//  101.对称二叉树.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/7.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个二叉树的根节点 root ， 检查它是否轴对称。

  

 示例 1：


 输入：root = [1,2,2,3,4,4,3]
 输出：true
 示例 2：


 输入：root = [1,2,2,null,3,null,3]
 输出：false
  

 提示：

 树中节点数目在范围 [1, 1000] 内
 -100 <= Node.val <= 100
  

 进阶：你可以运用递归和迭代两种方法解决这个问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/symmetric-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree7 = TreeNode.init(3, nil, nil)
 let tree6 = TreeNode.init(4, nil, nil)
 let tree5 = TreeNode.init(4, nil, nil)
 let tree4 = TreeNode.init(3, nil, nil)
 let tree3 = TreeNode.init(2, tree6, tree7)
 let tree2 = TreeNode.init(2, tree4, tree5)
 let tree1 = TreeNode.init(1, tree2, tree3)
 print(isSymmetric(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    
    var dp: [TreeNode?] = [root!.left, root!.right]
    
    while dp.count > 0 {
        let left: TreeNode? = dp.removeFirst()
        let right: TreeNode? = dp.removeFirst()
        
        if left == nil && right == nil {
            continue
        }
        
        if left == nil || right == nil {
            return false
        }
        
        if left!.val != right!.val {
            return false
        }
        
        dp.append(left?.left)
        dp.append(right?.right)
        
        dp.append(left?.right)
        dp.append(right?.left)
    }
    
    return true
}

//递归
func isSymmetric1(_ root: TreeNode?) -> Bool {
    
    func p_help(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        
        if left == nil || right == nil {
            return false
        }
        
        //核心其实就是: 左节点 == 右节点
        if left!.val != right!.val {
            return false
        }
        
        return p_help(left: left?.left, right: right?.right) && p_help(left: left?.right, right: right?.left)
    }
    
    return p_help(left: root?.left, right: root?.right)
}
