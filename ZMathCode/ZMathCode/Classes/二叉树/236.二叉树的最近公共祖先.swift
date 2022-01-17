//
//  236.二叉树的最近公共祖先.swift
//  ZMathCode
//
//  Created by QZD on 2022/1/13.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

 百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

  

 示例 1：


 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 输出：3
 解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
 示例 2：


 输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 输出：5
 解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。
 示例 3：

 输入：root = [1,2], p = 1, q = 2
 输出：1
  

 提示：

 树中节点数目在范围 [2, 105] 内。
 -109 <= Node.val <= 109
 所有 Node.val 互不相同 。
 p != q
 p 和 q 均存在于给定的二叉树中。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 let tree9 = TreeNode.init(4, nil, nil)
 let tree8 = TreeNode.init(7, nil, nil)
 let tree7 = TreeNode.init(8, nil, nil)
 let tree6 = TreeNode.init(0, nil, nil)
 let tree5 = TreeNode.init(2, tree8, tree9)
 let tree4 = TreeNode.init(6, nil, nil)
 let tree3 = TreeNode.init(1, tree6, tree7)
 let tree2 = TreeNode.init(5, tree4, tree5)
 let tree1 = TreeNode.init(3, tree2, tree3)
 print(lowestCommonAncestor(tree1, tree2, tree3))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || root?.val == p?.val || root?.val == q?.val {
        return root
    }
    //在左边找到p和q中离root最近的一个节点
    let left = lowestCommonAncestor(root?.left, p, q)
    //在右边找到p和q中离root最近的一个节点
    let right = lowestCommonAncestor(root?.right, p, q)
    
    if left == nil && right == nil {
        return nil
    } else if left == nil {
        return right
    } else if right == nil {
        return left
    }
    //如果left 和 right 都有,代表现在这个节点,就是最终结果
    return root
}
