//
//  21.合并两个有序链表_双指针.swift
//  ZMathCode
//
//  Created by QZD on 2022/8/17.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
## 题目
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

  

 示例 1：


 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 示例 2：

 输入：l1 = [], l2 = []
 输出：[]
 示例 3：

 输入：l1 = [], l2 = [0]
 输出：[0]
  

 提示：

 两个链表的节点数目范围是 [0, 50]
 -100 <= Node.val <= 100
 l1 和 l2 均按 非递减顺序 排列

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
## 测试代码:
 let l1 = ListNode(1)
 let l2 = ListNode(2)
 let l3 = ListNode(4)
 let l4 = ListNode(1)
 let l5 = ListNode(3)
 let l6 = ListNode(4)
 l1.next = l2
 l2.next = l3
 l4.next = l5
 l5.next = l6
 print("\(String(describing: mergeTwoLists(l1, l4)))")
 
## 笔记:
 用一个新的链表就行
 用一个虚拟的节点会比较好做, var head = ListNode(-1)
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */
import Foundation

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var left = list1
    var right = list2
    
    var head = ListNode(-1)
    let result = head
    while left != nil && right != nil {
        if left!.val < right!.val {
            head.next = left
            left = left?.next
        } else {
            head.next = right
            right = right?.next
        }
        head = head.next!
    }
    
    if left != nil {
        head.next = left
    }
    
    if right != nil {
        head.next = right
    }
    
    return result.next
}
