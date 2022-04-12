//
//  100.相同的树.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/12.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你两棵二叉树的根节点 p 和 q ，编写一个函数来检验这两棵树是否相同。

 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

  

 示例 1：


 输入：p = [1,2,3], q = [1,2,3]
 输出：true
 示例 2：


 输入：p = [1,2], q = [1,null,2]
 输出：false
 示例 3：


 输入：p = [1,2,1], q = [1,1,2]
 输出：false
  

 提示：

 两棵树上的节点数目都在范围 [0, 100] 内
 -104 <= Node.val <= 104


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/same-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree3 = TreeNode.init(3, nil, nil)
 let tree2 = TreeNode.init(2, nil, nil)
 let tree1 = TreeNode.init(1, tree2, tree3)
 
 let tree6 = TreeNode.init(3, nil, nil)
 let tree5 = TreeNode.init(2, nil, nil)
 let tree4 = TreeNode.init(1, tree5, tree6)
 print(isSameTree(tree1, tree4))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    
    func p_help(_ p: TreeNode?, _ q: TreeNode?)  -> Bool{
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }
        
        if p!.val == q!.val {
            return p_help(p?.left, q?.left) && p_help(p?.right, q?.right)
        }
        
        return false
    }
    
    return p_help(p, q)
}
