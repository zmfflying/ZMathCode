//
//  24.两两交换链表中的节点.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/3.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 示例 1：
 输入：head = [1,2,3,4]
 输出：[2,1,4,3]
 
 示例 2：
 输入：head = []
 输出：[]
 
 示例 3：
 输入：head = [1]
 输出：[1]
  
 提示：
 链表中节点的数目在范围 [0, 100] 内
 0 <= Node.val <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/swap-nodes-in-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let l1 = ListNode(1)
 let l2 = ListNode(2)
 let l3 = ListNode(3)
 let l4 = ListNode(4)
 l1.next = l2
 l2.next = l3
 l3.next = l4
 print("\(description1(l1: swapPairs(l1)!))")

## 笔记
 在我看来,这个数据处理分成了三部分
 假设本地循环的节点是 a -> b
 
 第一部分是上次交换后的尾结点,就是外部变量记录的 last
 第三部分是下次交换的首节点,就是本次开始循环的第二个节点的 b.next
 第二部分是本次交换的两个节点
 
 在进行交换前,需要把 b 赋值给上次交换的尾结点 last.next
 然后把 b.next 赋值给 a.next
 然后把 a 赋值给 b.next
 这样三部分数据就处理完了,可以进行下一次交换

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

func swapPairs(_ head: ListNode?) -> ListNode? {
    var first = head
    //记录下新的首节点
    let newHead = head?.next
    if newHead == nil {
        //如果就小于2个节点 直接返回 head
        return head
    }
    //记录一次交替后链表最后的节点
    var last: ListNode?
    
    while first != nil {
        //先记录下第二节点
        let second = first?.next
        if last != nil && second != nil {
            //这里把第二个节点赋值给上一次交替后的尾节点的next
            last?.next = second
        }
        //这是把下次交替的首节点赋值给第一个节点的next
        first?.next = second?.next
        //交换第一个和第二个
        second?.next = first
        //记录下本次交替后的最后节点
        last = first
        //开始下次交替
        first = first?.next
    }
    return newHead
}
