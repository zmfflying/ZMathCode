//
//  199.二叉树的右视图.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/25.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

 示例:

 输入: [1,2,3,null,5,null,4]
 输出: [1, 3, 4]
 解释:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-right-side-view
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 let tree5 = TreeNode.init(5, nil, nil)
 let tree4 = TreeNode.init(4, nil, nil)
 let tree3 = TreeNode.init(3, nil, nil)
 let tree2 = TreeNode.init(2, tree3, tree4)
 let tree1 = TreeNode.init(1, tree2, tree5)
 print(rightSideView(tree1))

## 笔记
 这道题其实就是要拿到每一层最右边的节点
 那肯定就是层序遍历
 用队列好做一点,先进先出,那么每层循环结束的时候,最后的那个就是最右边的节点
 
 需要注意的是怎么取到这个本层中最右边的节点, 而且不会重复使用
 我用的是两个循环嵌套
 外面的循环一层只走一次,所以就能知道本层一共有几个节点,进而在队列中取到最右边的节点
 里面的循环是为了找到下一层的所有节点
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init() { self.val = 0; self.left = nil; self.right = nil; }
//    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
//    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
//        self.val = val
//        self.left = left
//        self.right = right
//    }
//}

func rightSideView(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    
    var res: [Int] = [Int]()
    //队列 先进先出 左边先进,右边后进
    //所以每层的最后一个就是最右边的节点
    var queue: [TreeNode] = [root!]
    
    while queue.count != 0 {
        //对本层进行迭代 找到下一层的所有节点
        var index = 0
        let curCount = queue.count
        
        while index < curCount {
            //队列 先进先出 取first
            let node = queue.removeFirst()
            
            //每层的最后一个就是最右边的节点
            if index == curCount - 1 {
                res.append(node.val)
            }
            
            //这两步会把下一层的数据都加到队列中
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
            
            index += 1
        }
    }
    
    return res
}
