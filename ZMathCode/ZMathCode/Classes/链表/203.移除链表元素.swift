//
//  203.移除链表元素.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/2.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 删除链表中等于给定值 val 的所有节点。

 示例:

 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5

## 测试代码
 let l1 = ListNode(1)
 let l2 = ListNode(2)
 let l3 = ListNode(6)
 let l4 = ListNode(3)
 let l5 = ListNode(4)
 let l6 = ListNode(5)
 let l7 = ListNode(6)
 l1.next = l2
 l2.next = l3
 l3.next = l4
 l4.next = l5
 l5.next = l6
 l6.next = l7
 print("\(description1(l1: removeElements(l1, 6)!))")

## 笔记
 核心是要找到新的头节点和替换后的.next可能也是重复的
 循环中只要当前节点的值不等于指定值,那么当前节点就是头节点,不能重复赋值
 
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

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var res: ListNode?
    var temp = head
    while temp != nil {
        if temp?.val != val && res == nil {
            //这一步是找出新的头结点
            res = temp
        }
        
        if temp?.next?.val == val {
            //这里是把next的节点替换掉
            //替换后不能改变temp的头结点
            //因为新的next节点可能也是重复的
            temp?.next = temp?.next?.next
        } else {
            temp = temp?.next
        }
    }
    return res
}
