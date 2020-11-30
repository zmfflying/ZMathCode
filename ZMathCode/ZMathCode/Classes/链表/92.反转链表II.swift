//
//  92.反转链表II.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/11/30.
//  Copyright © 2020 zmfflying. All rights reserved.
//

/**
## 题目
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:

 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let l1 = ListNode(1)
 let l2 = ListNode(2)
 let l3 = ListNode(3)
 let l4 = ListNode(4)
 let l5 = ListNode(5)
 l1.next = l2
 l2.next = l3
 l3.next = l4
 l4.next = l5
 print("\(description1(l1: reverseBetween(l1, 2, 4)!))")

## 笔记
 我看题目的要求是一遍循环,但是很多题解都是两遍,不太明白是为什么
 在我看来,这道题的核心是找到三段数据,也就是找到四个节点
 第一段是反转开始之前的那段数据, 即原来 m-1 的节点
 第二段是反转之后的中间那段数据, 即原来 m 的节点和原来 n 的节点
 第三个是反转之后最后的那段数据, 即原来的 n+1 的节点
 更详细的过程见代码

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



func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    //第一部分数据: 记录下 原来 m-1 的数据
    var pre: ListNode?
    
    //第二部分数据: 记录下 原来 m 的数据
    var last: ListNode?
    //第二部分数据: reverse 是记录的反转后的链表, 即原来 n 的数据
    var reverse = head
    
    //第三部分数据: 跳出循环后, res就是原来 n+1 的数据
    var res = head
    
    //记录下节点
    var index = 1
    
    while res != nil {
        if index < m {
            //找到第一部分数据 m=1的时候这里不会走
            pre = res
            res = res?.next
        } else if index >= m && index <= n {
            //反转过程 找到第二部分数据
            let temp = res?.next
            res?.next = nil
            res?.next = reverse
            if index == m {
                last = res
            }
            reverse = res
            res = temp
        } else {
            //遍历到 index = n后就可以跳出循环了 这个时候的res就是原来 n+1 的数据
            break
        }
        index += 1
    }
    
    //reverse 是原来 n 的节点, 现在把它接到第一段数据的后面
    pre?.next = reverse
    //last 是原来 m 的节点, 现在把第三段数据接到它的后面
    last?.next = res
    //如果有第一段数据, 那首节点没有改变, 返回 head 即可
    if pre != nil {
        return head
    }
    //如果没有第一段数据, 那么 reverse 是原来 n 的节点, 就是现在的首节点
    return reverse
}
