//
//  515.在每个树行中找最大值.swift
//  ZMathCode
//
//  Created by QZD on 2022/5/7.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一棵二叉树的根节点 root ，请找出该二叉树中每一层的最大值。

  

 示例1：



 输入: root = [1,3,2,5,3,null,9]
 输出: [1,3,9]
 示例2：

 输入: root = [1,2,3]
 输出: [1,3]
  

 提示：

 二叉树的节点个数的范围是 [0,104]
 -231 <= Node.val <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-largest-value-in-each-tree-row
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree6 = TreeNode.init(9, nil, nil)
 let tree5 = TreeNode.init(3, nil, nil)
 let tree4 = TreeNode.init(5, nil, nil)
 let tree3 = TreeNode.init(2, nil, tree6)
 let tree2 = TreeNode.init(3, tree4, tree5)
 let tree1 = TreeNode.init(1, tree2, tree3)
 print(largestValues(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func largestValues(_ root: TreeNode?) -> [Int] {
    //提前剪枝
    if root == nil {
        return []
    }
    
    var result: [Int] = [Int].init()
    var dp: [TreeNode?] = [root]
    var tmpNum: Int
    
    while !dp.isEmpty {
        tmpNum = dp[0]!.val
        //记录下一层的 node
        var tmpArr: [TreeNode?] = [TreeNode?].init()
        for node: TreeNode? in dp {
            if node == nil {
                continue
            }
            
            tmpNum = max(node!.val, tmpNum)
            
            //提前剪枝
            if let left = node!.left {
                tmpArr.append(left)
            }
            
            if let right = node!.right {
                tmpArr.append(right)
            }
        }
        
        result.append(tmpNum)
        dp = tmpArr
    }
    
    return result
}
