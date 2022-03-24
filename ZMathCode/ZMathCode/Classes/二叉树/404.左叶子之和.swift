//
//  404.左叶子之和.swift
//  ZMathCode
//
//  Created by QZD on 2022/3/24.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定二叉树的根节点 root ，返回所有左叶子之和。

  

 示例 1：



 输入: root = [3,9,20,null,null,15,7]
 输出: 24
 解释: 在这个二叉树中，有两个左叶子，分别是 9 和 15，所以返回 24
 示例 2:

 输入: root = [1]
 输出: 0
  

 提示:

 节点数在 [1, 1000] 范围内
 -1000 <= Node.val <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sum-of-left-leaves
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree5 = TreeNode.init(7, nil, nil)
 let tree4 = TreeNode.init(15, nil, nil)
 let tree3 = TreeNode.init(20, tree4, tree5)
 let tree2 = TreeNode.init(9, nil, nil)
 let tree1 = TreeNode.init(3, tree2, tree3)
 print(sumOfLeftLeaves(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    var res: Int = 0
    
    func p_help(node: TreeNode?, isLeft: Bool) {
        if node == nil {
            return
        }
        
        if isLeft && node?.left == nil && node?.right == nil {
            res += node!.val
        }
        
        p_help(node: node?.left, isLeft: true)
        p_help(node: node?.right, isLeft: false)
    }
    
    p_help(node: root, isLeft: false)
    return res
}
