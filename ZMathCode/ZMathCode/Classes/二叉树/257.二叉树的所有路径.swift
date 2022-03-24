//
//  257.二叉树的所有路径.swift
//  ZMathCode
//
//  Created by QZD on 2022/3/24.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个二叉树的根节点 root ，按 任意顺序 ，返回所有从根节点到叶子节点的路径。

 叶子节点 是指没有子节点的节点。

  
 示例 1：


 输入：root = [1,2,3,null,5]
 输出：["1->2->5","1->3"]
 示例 2：

 输入：root = [1]
 输出：["1"]
  

 提示：

 树中节点的数目在范围 [1, 100] 内
 -100 <= Node.val <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-paths
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let tree4 = TreeNode.init(5, nil, nil)
 let tree3 = TreeNode.init(3, nil, nil)
 let tree2 = TreeNode.init(2, nil, tree4)
 let tree1 = TreeNode.init(4, tree2, tree3)
 print(binaryTreePaths(tree1))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var res: [String] = [String].init()
    var arr: [String] = [String].init()
    
    func p_help(node: TreeNode?) {
        if node == nil {
            return
        }
        
        arr.append("\(node!.val)")
        
        if node?.left == nil && node?.right == nil {
            res.append(arr.joined(separator: "->"))
        } else {
            p_help(node: node?.left)
            p_help(node: node?.right)
        }
        
        arr.removeLast()
    }
    
    p_help(node: root)
    return res
}
