//
//  437.路径总和III.swift
//  ZMathCode
//
//  Created by QZD on 2022/1/19.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个二叉树的根节点 root ，和一个整数 targetSum ，求该二叉树里节点值之和等于 targetSum 的 路径 的数目。

 路径 不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。

  

 示例 1：



 输入：root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
 输出：3
 解释：和等于 8 的路径有 3 条，如图所示。
 示例 2：

 输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 输出：3
  

 提示:

 二叉树的节点个数的范围是 [0,1000]
 -109 <= Node.val <= 109
 -1000 <= targetSum <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/path-sum-iii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree9 = TreeNode.init(1, nil, nil)
 let tree8 = TreeNode.init(-2, nil, nil)
 let tree7 = TreeNode.init(3, nil, nil)
 let tree6 = TreeNode.init(11, nil, nil)
 let tree5 = TreeNode.init(2, nil, tree9)
 let tree4 = TreeNode.init(3, tree7, tree8)
 let tree3 = TreeNode.init(-3, nil, tree6)
 let tree2 = TreeNode.init(5, tree4, tree5)
 let tree1 = TreeNode.init(10, tree2, tree3)
 print(pathSum(tree1, 8))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
    
    var res: Int = 0
    //记录前缀和
    var map: [Int: Int] = [0 : 1]
    
    func p_help(node: TreeNode?, sum: Int) {
        if node == nil {
            return
        }
        
        let curSum: Int = sum + node!.val
        //前缀和里有 curSum - targetSum 就代表有路径
        //注意前缀和是累加的, 不存在重复问题
        if let count = map[curSum - targetSum] {
            res += count
        }
        
        //更新前缀和
        if let count = map[curSum] {
            map[curSum] = count + 1
        } else {
            map[curSum] = 1
        }
        
        p_help(node: node?.left, sum: curSum)
        p_help(node: node?.right, sum: curSum)
        //处理完本层数据了要维护前缀和的数据正确
        map[curSum] = map[curSum]! - 1
    }
    
    p_help(node: root, sum: 0)
    return res
}
