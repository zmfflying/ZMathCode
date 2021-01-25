//
//  144.二叉树的前序遍历.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/25.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你二叉树的根节点 root ，返回它节点值的 前序 遍历。

 示例 1：


 输入：root = [1,null,2,3]
 输出：[1,2,3]
 示例 2：

 输入：root = []
 输出：[]
 示例 3：

 输入：root = [1]
 输出：[1]
 示例 4：


 输入：root = [1,2]
 输出：[1,2]
 示例 5：


 输入：root = [1,null,2]
 输出：[1,2]
  

 提示：

 树中节点数目在范围 [0, 100] 内
 -100 <= Node.val <= 100
  

 进阶：递归算法很简单，你可以通过迭代算法完成吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 let tree5 = TreeNode.init(5, nil, nil)
 let tree4 = TreeNode.init(4, nil, nil)
 let tree3 = TreeNode.init(3, nil, nil)
 let tree2 = TreeNode.init(2, tree3, tree4)
 let tree1 = TreeNode.init(1, tree2, tree5)
 print(preorderTraversal(tree1))

## 笔记
 迭代法就是用一个栈,来记录左右子节点
 因为这道题要求是前序遍历,中 左 右, 然后栈的特性是后入先出
 所以右节点先入栈,左节点后入栈
 这样取的时候就能先取到左节点
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

//迭代
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var res: [Int] = [Int]()
    //栈
    var stack: [TreeNode] = [root!]
    while stack.count != 0 {
        //取出栈顶的节点
        let tree = stack.popLast()
        res.append(tree!.val)
        
        //前序遍历是  中 左 右
        //栈是后入先出 所以右边先入栈 然后左边再入栈
        //这样取出来的时候 左节点就在右节点的前面了
        if let right = tree?.right {
            stack.append(right)
        }

        if let left = tree?.left {
            stack.append(left)
        }

    }
    return res
}

//递归
//func preorderTraversal(_ root: TreeNode?) -> [Int] {
//    var res: [Int] = [Int]()
//
//    func help(root: TreeNode?) {
//        if root == nil {
//            return
//        }
//        res.append(root!.val)
//        help(root: root?.left)
//        help(root: root?.right)
//    }
//
//    help(root: root)
//    return res
//}
