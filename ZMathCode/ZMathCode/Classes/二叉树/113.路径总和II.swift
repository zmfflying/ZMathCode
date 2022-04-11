//
//  113.路径总和II.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/11.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。

 叶子节点 是指没有子节点的节点。

  

 示例 1：


 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：[[5,4,11,2],[5,8,4,5]]
 示例 2：


 输入：root = [1,2,3], targetSum = 5
 输出：[]
 示例 3：

 输入：root = [1,2], targetSum = 0
 输出：[]
  

 提示：

 树中节点总数在范围 [0, 5000] 内
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/path-sum-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree3 = TreeNode.init(4, nil, nil)
 let tree2 = TreeNode.init(2, nil, nil)
 let tree1 = TreeNode.init(1, tree2, tree3)
 print(pathSum1(tree1, 5))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func pathSum1(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
    if root == nil {
        return []
    }
    
    var reslut: [[Int]] = [[Int]].init()
    var dp: [Int] = [Int].init()
    var curSum: Int = 0
    
    func p_help(node: TreeNode?) {
        if node == nil {
            return
        }
        dp.append(node!.val)
        curSum += node!.val
        
        if node?.left == nil && node?.right == nil && curSum == targetSum {
            reslut.append(dp)
        } else {
            p_help(node: node?.left)
            p_help(node: node?.right)
        }
        curSum -= node!.val
        dp.removeLast()
    }
    p_help(node: root)
    return reslut
}
