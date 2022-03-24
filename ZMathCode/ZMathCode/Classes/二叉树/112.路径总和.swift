//
//  112.路径总和.swift
//  ZMathCode
//
//  Created by QZD on 2022/3/24.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum 。判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。如果存在，返回 true ；否则，返回 false 。

 叶子节点 是指没有子节点的节点。

  

 示例 1：


 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 输出：true
 解释：等于目标和的根节点到叶节点路径如上图所示。
 示例 2：


 输入：root = [1,2,3], targetSum = 5
 输出：false
 解释：树中存在两条根节点到叶子节点的路径：
 (1 --> 2): 和为 3
 (1 --> 3): 和为 4
 不存在 sum = 5 的根节点到叶子节点的路径。
 示例 3：

 输入：root = [], targetSum = 0
 输出：false
 解释：由于树是空的，所以不存在根节点到叶子节点的路径。
  

 提示：

 树中节点的数目在范围 [0, 5000] 内
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree10 = TreeNode.init(1, nil, nil)
 let tree9 = TreeNode.init(2, nil, nil)
 let tree8 = TreeNode.init(7, nil, nil)
 let tree7 = TreeNode.init(4, nil, tree10)
 let tree6 = TreeNode.init(13, nil, nil)
 let tree5 = TreeNode.init(11, tree8, tree9)
 let tree4 = TreeNode.init(8, tree6, tree7)
 let tree3 = TreeNode.init(4, tree5, nil)
 let tree2 = TreeNode.init(5, tree3, tree4)
 print(hasPathSum(tree2))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    var res: Bool = false
    
    func p_help(node: TreeNode?, sum: Int) {
        if node == nil {
            return
        }
        
        let curSum: Int = sum + node!.val
        if curSum == targetSum && node?.left == nil && node?.right == nil {
            res = true
            return
        }
        
        p_help(node: node?.left, sum: curSum)
        
        if res {
            return
        }
        p_help(node: node?.right, sum: curSum)
    }
    
    p_help(node: root, sum: 0)
    return res
}


//func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//
//    func p_help(node: TreeNode?, sum: Int) -> Bool {
//        if node == nil {
//            return false
//        }
//
//        let curSum: Int = sum + node!.val
//        if curSum == targetSum && node?.left == nil && node?.right == nil {
//            return true
//        }
//
//        return p_help(node: node?.left, sum: curSum) || p_help(node: node?.right, sum: curSum)
//    }
//
//    return p_help(node: root, sum: 0)
//}

