//
//  2.两数相加.swift
//  ZMathCode
//
//  Created by zmfflying on 2020/6/23.
//  Copyright © 2020 zmfflying. All rights reserved.
//

/**
## 题目
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。

 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。

 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：

 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
## 测试代码:
 let l1 = ListNode(2)
 let l11 = ListNode(4)
 let l111 = ListNode(3)
 let l1111 = ListNode(1)
 l1.next = l11
 l11.next = l111
 l111.next = l1111
 print("\(description1(l1: l1))")
 
 let l2 = ListNode(5)
 let l22 = ListNode(6)
 let l222 = ListNode(4)
 l2.next = l22
 l22.next = l222
 print("\(description1(l1: l2))")
 
 print("\(description1(l1: addTwoNumbers(l1,l2)!))")
 
## 笔记:
 核心就是创建一个新的链表,然后每次把两个的和加上去赋值,考虑下和大于9的情况和链表最后一位大于9的情况;
 之前有想过不开辟新的链表，直接把值加载第一个链表上的思路，但失败了
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var res = ListNode(0)
    let head = res
    var tem1 = l1
    var tem2 = l2
    var isAdd = false
    while tem1 != nil || tem2 != nil {
        var sum = (tem1?.val ?? 0) + (tem2?.val ?? 0)
        sum = isAdd ?(sum + 1) :sum
        if sum > 9 {
            isAdd = true
            sum = sum - 10
        } else {
            isAdd = false
        }
        res.next = ListNode(sum)
        res = res.next!
        tem1 = tem1?.next
        tem2 = tem2?.next
    }
    
    if isAdd {
        res.next = ListNode(1)
    }
    return head.next
}
