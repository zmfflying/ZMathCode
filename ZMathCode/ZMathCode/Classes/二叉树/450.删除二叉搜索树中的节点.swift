//
//  450.删除二叉搜索树中的节点.swift
//  ZMathCode
//
//  Created by QZD on 2022/1/18.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个二叉搜索树的根节点 root 和一个值 key，删除二叉搜索树中的 key 对应的节点，并保证二叉搜索树的性质不变。返回二叉搜索树（有可能被更新）的根节点的引用。

 一般来说，删除节点可分为两个步骤：

 首先找到需要删除的节点；
 如果找到了，删除它。
  

 示例 1:



 输入：root = [5,3,6,2,4,null,7], key = 3
 输出：[5,4,6,2,null,null,7]
 解释：给定需要删除的节点值是 3，所以我们首先找到 3 这个节点，然后删除它。
 一个正确的答案是 [5,4,6,2,null,null,7], 如下图所示。
 另一个正确答案是 [5,2,6,null,4,null,7]。


 示例 2:

 输入: root = [5,3,6,2,4,null,7], key = 0
 输出: [5,3,6,2,4,null,7]
 解释: 二叉树不包含值为 0 的节点
 示例 3:

 输入: root = [], key = 0
 输出: []
  

 提示:

 节点数的范围 [0, 104].
 -105 <= Node.val <= 105
 节点值唯一
 root 是合法的二叉搜索树
 -105 <= key <= 105
  

 进阶： 要求算法时间复杂度为 O(h)，h 为树的高度。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/delete-node-in-a-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree6 = TreeNode.init(7, nil, nil)
 let tree5 = TreeNode.init(4, nil, nil)
 let tree4 = TreeNode.init(2, nil, nil)
 let tree3 = TreeNode.init(6, tree6, nil)
 let tree2 = TreeNode.init(3, tree4, tree5)
 let tree1 = TreeNode.init(5, tree2, tree3)
 print(deleteNode(tree1, 3)?.val)
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    
    func p_help(_ root: inout TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        if let v = root?.val {
            if v < key {
                //如果目标节点大于当前节点值，则去右子树中删除；
                root?.right = deleteNode(root?.right, key)
            } else if v > key {
                //如果目标节点小于当前节点值，则去左子树中删除；
                root?.left = deleteNode(root?.left, key)
            } else {
                //如果目标节点就是当前节点，分为以下三种情况：
                if root?.left == nil {
                    //其无左子：其右子顶替其位置，删除了该节点；
                    return root?.right
                } else if root?.right == nil {
                    //其无右子：其左子顶替其位置，删除了该节点；
                    return root?.left
                } else {
                    //其左右子节点都有：其左子树转移到其右子树的最左节点的左子树上，然后右子树顶替其位置，由此删除了该节点。
                    var node = root?.right
                    while node?.left != nil {
                        node = node?.left
                    }
                    
                    node?.left = root?.left
                    root = root?.right
                }
            }
        }
        
        return root
    }
    
    var node = root
    return p_help(&node, key)
}
