//
//  111.二叉树的最小深度.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/7.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明：叶子节点是指没有子节点的节点。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：2
 示例 2：

 输入：root = [2,null,3,null,4,null,5,null,6]
 输出：5
  

 提示：

 树中节点数的范围在 [0, 105] 内
 -1000 <= Node.val <= 1000


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-depth-of-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree5 = TreeNode.init(7, nil, nil)
 let tree4 = TreeNode.init(15, nil, nil)
 let tree3 = TreeNode.init(20, tree4, tree5)
 let tree2 = TreeNode.init(9, nil, nil)
 let tree1 = TreeNode.init(3, tree2, tree3)
 print(minDepth(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func minDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let left = minDepth(root?.left)
    let right = minDepth(root?.right)
    return left == 0 ? right+1 : right == 0 ? left+1 : min(left, right)+1
}

func minDepth1(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    var result: Int = Int.max
    func p_help(node: TreeNode?, height: Int) {
        if node == nil {
            return
        }
        
        if node?.left == nil && node?.right == nil {
            result = min(result, height + 1)
            return
        }
        
        p_help(node: node?.left, height: height + 1)
        p_help(node: node?.right, height: height + 1)
    }
    
    p_help(node: root, height: 0)
    return result
}
