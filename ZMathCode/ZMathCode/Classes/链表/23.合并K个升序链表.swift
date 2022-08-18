//
//  23.合并K个升序链表.swift
//  ZMathCode
//
//  Created by QZD on 2022/8/18.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
## 题目
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。

  

 示例 1：

 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：

 输入：lists = []
 输出：[]
 示例 3：

 输入：lists = [[]]
 输出：[]
  

 提示：

 k == lists.length
 0 <= k <= 10^4
 0 <= lists[i].length <= 500
 -10^4 <= lists[i][j] <= 10^4
 lists[i] 按 升序 排列
 lists[i].length 的总和不超过 10^4

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/merge-k-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
## 测试代码:
 let l1 = ListNode(1)
 let l2 = ListNode(2)
 let l3 = ListNode(4)
 let l4 = ListNode(1)
 let l5 = ListNode(3)
 let l6 = ListNode(4)
 let l7 = ListNode(0)
 let l8 = ListNode(6)
 l1.next = l2
 l2.next = l3
 l4.next = l5
 l5.next = l6
 l7.next = l8
 
 
## 笔记:
 直接把所有 val 放到一个数组里, 然后进行排序
 最后遍历数组, 创建 node
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

//一次值排序, 直接创建新的 node
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    if lists.count == 0 {
        return nil
    }
    
    if lists.count == 1 {
        return lists.first!
    }
    
    var arr: [Int] = [Int].init()
    
    for var node: ListNode? in lists {
        while node != nil {
            arr.append(node!.val)
            node = node?.next
        }
    }
    arr = arr.sorted()
    
    var head = ListNode(-1)
    let result = head
    
    for num in arr {
        let newNode = ListNode(num)
        head.next = newNode
        head = head.next!
    }
    
    return result.next
}

//每次都对数组进行排序, 找到最小值
//func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//    //排序
//    func smallest(_ lists: [ListNode?]) -> Int {
//        var index: Int = 0
//        if lists.count == 0 {
//            return index
//        }
//        var smallest: ListNode? = lists[0]
//        if smallest == nil || lists.count == 1 {
//            return index
//        }
//        for (i, node) in lists.enumerated() {
//            if node != nil && node!.val < smallest!.val {
//                smallest = node
//                index = i
//            }
//        }
//
//        return index
//    }
//
//    if lists.count == 0 {
//        return nil
//    }
//
//    if lists.count == 1 {
//        return lists.first!
//    }
//
//    var arr = lists
//    var head = ListNode(-1)
//    let result = head
//
//    while arr.count > 0 {
//        let index = smallest(arr)
//        let node = arr[index]
//
//        if node != nil {
//            head.next = node
//            head = head.next!
//        }
//
//        if node?.next == nil {
//            arr.remove(at: index)
//        } else {
//            arr[index] = node?.next
//        }
//    }
//
//
//    return result.next
//}
