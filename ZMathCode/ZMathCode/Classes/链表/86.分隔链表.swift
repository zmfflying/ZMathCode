//
//  86.分隔链表.swift
//  ZMathCode
//
//  Created by QZD on 2022/8/19.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
## 题目
 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。

 你应当 保留 两个分区中每个节点的初始相对位置。

  

 示例 1：


 输入：head = [1,4,3,2,5,2], x = 3
 输出：[1,2,2,4,3,5]
 示例 2：

 输入：head = [2,1], x = 2
 输出：[1,2]
  

 提示：

 链表中节点的数目在范围 [0, 200] 内
 -100 <= Node.val <= 100
 -200 <= x <= 200


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/partition-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
## 测试代码:
 let l1 = ListNode(1)
 let l2 = ListNode(4)
 let l3 = ListNode(3)
 let l4 = ListNode(2)
 let l5 = ListNode(5)
 let l6 = ListNode(2)
 l1.next = l2
 l2.next = l3
 l3.next = l4
 l4.next = l5
 l5.next = l6 
 
## 笔记:
 就弄两个链表,一个记录小的,一个记录大的,最后合并
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    if head == nil {
        return head
    }
    var list = head;
    var small: ListNode? = ListNode(-1)
    var big: ListNode? = ListNode(-1)
    
    let result = small
    let tail = big
    
    while list != nil {
        if list!.val < x {
            small?.next = list
            small = small?.next
        } else {
            big?.next = list
            big = big?.next
        }
        
        list = list?.next
    }
    big?.next = nil
    small?.next = tail?.next
    
    return result?.next
}

