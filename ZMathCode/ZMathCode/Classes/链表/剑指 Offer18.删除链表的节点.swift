//
//  剑指Offer18.删除链表的节点.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/2.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。

 返回删除后的链表的头节点。

 注意：此题对比原题有改动

 示例 1:

 输入: head = [4,5,1,9], val = 5
 输出: [4,1,9]
 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
 示例 2:

 输入: head = [4,5,1,9], val = 1
 输出: [4,5,9]
 解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
  

 说明：

 题目保证链表中节点的值互不相同
 若使用 C 或 C++ 语言，你不需要 free 或 delete 被删除的节点


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let l1 = ListNode(4)
 let l2 = ListNode(5)
 let l3 = ListNode(1)
 let l4 = ListNode(9)
 l1.next = l2
 l2.next = l3
 l3.next = l4
 print("\(description1(l1: deleteNode(l1, 5)!))")

## 笔记
 考虑下删除的是首节点情况,直接返回head.next
 遍历链表,判断当前节点.next的值
 找到后设置 当前节点.next.next为 当前节点.next，然后跳出循环即可

## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

/**
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
     
 }

 func description1(l1: ListNode) -> String {
     var tem1 = l1
     var text = String()
     while tem1.next != nil {
         text.append("\(tem1.val) ->")
         tem1 = tem1.next!
     }
     text.append("\(tem1.val)")
     return text
 }
 */

func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head?.val == val {
        return head?.next
    }
    var res = head
    while res != nil {
        if res?.next?.val == val {
            res?.next = res?.next?.next
            break
        }
        res = res?.next
    }
    return head
}

