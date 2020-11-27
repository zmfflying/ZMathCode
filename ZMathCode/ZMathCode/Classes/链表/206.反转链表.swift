//
//  206.反转链表.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/11/27.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 反转一个单链表。

 示例:

 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let l1 = ListNode(1)
 let l11 = ListNode(2)
 let l111 = ListNode(3)
 let l1111 = ListNode(4)
 l1.next = l11
 l11.next = l111
 l111.next = l1111
 print("\(description1(l1: reverseList(l1)!))")

## 笔记
 迭代法是创建一个新的链表,
 每次把传入链表的第一个取出来,
 然后把取出来的这个链表的next赋值为新的链表,
 然后让新的链表等于取出来的这个链表,
 最后返回新的链表
 
 我自己想的递归法和上面迭代法是一样的逻辑,
 只是每次从最后一个开始取

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

//迭代法
//func reverseList(_ head: ListNode?) -> ListNode? {
//    var temp = head?.next
//    var res = head
//    res?.next = nil
//    while temp != nil {
//        let next = temp?.next
//        temp?.next = res
//        res = temp
//        temp = next
//    }
//    return res
//}

//递归法 最优解  太难理解了
//func reverseList(_ head: ListNode?) -> ListNode? {
//    if head?.next == nil {
//        return head
//    }
//    let temp = reverseList(head?.next)
//    head?.next?.next = head
//    head?.next = nil
//    return temp
//}


//递归法  我自己的想法
var res: ListNode?
func reverseList(_ head: ListNode?) -> ListNode? {
    help(head)
    return res
}

func help(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
        res = head
        return head
    }
    let temp = help(head?.next)
    temp?.next = head
    head?.next = nil
    return temp?.next
}
