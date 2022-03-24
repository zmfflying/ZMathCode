//
//  129.求根节点到叶节点数字之和.swift
//  ZMathCode
//
//  Created by QZD on 2022/3/24.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个二叉树的根节点 root ，树中每个节点都存放有一个 0 到 9 之间的数字。
 每条从根节点到叶节点的路径都代表一个数字：

 例如，从根节点到叶节点的路径 1 -> 2 -> 3 表示数字 123 。
 计算从根节点到叶节点生成的 所有数字之和 。

 叶节点 是指没有子节点的节点。

  

 示例 1：


 输入：root = [1,2,3]
 输出：25
 解释：
 从根到叶子节点路径 1->2 代表数字 12
 从根到叶子节点路径 1->3 代表数字 13
 因此，数字总和 = 12 + 13 = 25
 示例 2：


 输入：root = [4,9,0,5,1]
 输出：1026
 解释：
 从根到叶子节点路径 4->9->5 代表数字 495
 从根到叶子节点路径 4->9->1 代表数字 491
 从根到叶子节点路径 4->0 代表数字 40
 因此，数字总和 = 495 + 491 + 40 = 1026
  

 提示：

 树中节点的数目在范围 [1, 1000] 内
 0 <= Node.val <= 9
 树的深度不超过 10

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sum-root-to-leaf-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree5 = TreeNode.init(1, nil, nil)
 let tree4 = TreeNode.init(5, nil, nil)
 let tree3 = TreeNode.init(0, nil, nil)
 let tree2 = TreeNode.init(9, tree4, tree5)
 let tree1 = TreeNode.init(4, tree2, tree3)
 print(sumNumbers(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func sumNumbers(_ root: TreeNode?) -> Int {
    var res: Int = 0
    //记录当前路径数字之和
    var sum: Int = 0
    
    func p_help(node: TreeNode?) {
        if node == nil {
            return
        }
        
        if node?.left == nil && node?.right == nil {
            res += sum * 10 + node!.val
            return
        }
        
        sum = sum * 10 + node!.val
        p_help(node: node?.left)
        p_help(node: node?.right)
        //本层处理结束后还原sum
        sum = sum / 10
    }
    
    p_help(node: root)
    return res
}
