//
//  19.删除链表的倒数第N个节点.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/2.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：

 给定一个链表: 1->2->3->4->5, 和 n = 2.

 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：

 给定的 n 保证是有效的。

 进阶：

 你能尝试使用一趟扫描实现吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
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
 print("\(description1(l1: removeNthFromEnd(l1, 2)!))")

## 笔记
 我自己的想法是利用字典(哈希表),把每个节点对应的 index 为 key,节点为 value
 这样循环一次后,也知道了总的节点个数,用总个数减去传进来的 n,就知道了要找的 index
 那么将 index-1 的节点的 next 赋值为 .next.next 即可
 
 快慢指针的思路是先将 fast 的节点往后移 n 次
 然后 fast 和 slow 一起往后移动,当 fast = nil 的时候,slow 就是倒数第 n 个节点
 那么当 fast.next = nil 的时候,slow 就是倒数第 n+1 个节点
 这时候让 slow.next = slow.next.next 就好了
 
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

//利用字典
//func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//    var dic: [Int: ListNode] = [Int: ListNode]()
//    var temp = head
//    var index = 1
//    while temp != nil {
//        dic[index] = temp
//        temp = temp?.next
//        index += 1
//    }
//    let cur = index - n
//    if cur == 1 {
//        return dic[2]
//    } else {
//        dic[cur-1]?.next = dic[cur-1]?.next?.next
//    }
//    return head
//}

//快慢指针
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var index = n
    var fast = head
    var slow = head
    
    while index != 0 {
        fast = fast?.next
        index -= 1
    }
    
    if fast == nil {
        return head?.next
    }
    //当 fast 为 nil 的时候,slow 就是倒数第 n 个节点
    //所以 fast.next 为 nil 的时候,slow 就是倒数第 n+1 个节点
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    slow?.next = slow?.next?.next
    return head
}
