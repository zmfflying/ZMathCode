//
//  102.二叉树的层序遍历.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/8.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你二叉树的根节点 root ，返回其节点值的 层序遍历 。 （即逐层地，从左到右访问所有节点）。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：[[3],[9,20],[15,7]]
 示例 2：

 输入：root = [1]
 输出：[[1]]
 示例 3：

 输入：root = []
 输出：[]
  

 提示：

 树中节点数目在范围 [0, 2000] 内
 -1000 <= Node.val <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree5 = TreeNode.init(7, nil, nil)
 let tree4 = TreeNode.init(15, nil, nil)
 let tree3 = TreeNode.init(20, tree4, tree5)
 let tree2 = TreeNode.init(9, nil, nil)
 let tree1 = TreeNode.init(3, tree2, tree3)
 print(levelOrder(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var result: [[Int]] = [[Int]].init()
    
    var dp: [TreeNode?] = [root]
    while dp.count > 0 {
        var tmpArr: [Int] = [Int].init()
        var tmpDp: [TreeNode?] = []
        for node: TreeNode? in dp {
            if node != nil {
                tmpArr.append(node!.val)
            }
            
            if node?.left != nil {
                tmpDp.append(node?.left)
            }
            
            if node?.right != nil {
                tmpDp.append(node?.right)
            }
        }
        dp = tmpDp
        result.append(tmpArr)
    }
    
    return result
}
