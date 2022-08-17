//
//  142.环形链表II_双指针.swift
//  ZMathCode
//
//  Created by QZD on 2022/8/16.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个链表的头节点  head ，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。

 不允许修改 链表。

  

 示例 1：



 输入：head = [3,2,0,-4], pos = 1
 输出：返回索引为 1 的链表节点
 解释：链表中有一个环，其尾部连接到第二个节点。
 示例 2：



 输入：head = [1,2], pos = 0
 输出：返回索引为 0 的链表节点
 解释：链表中有一个环，其尾部连接到第一个节点。
 示例 3：



 输入：head = [1], pos = -1
 输出：返回 null
 解释：链表中没有环。
  

 提示：

 链表中节点的数目范围在范围 [0, 104] 内
 -105 <= Node.val <= 105
 pos 的值为 -1 或者链表中的一个有效索引
  

 进阶：你是否可以使用 O(1) 空间解决此题？

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/linked-list-cycle-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
## 测试代码:
 let l1 = ListNode(3)
 let l2 = ListNode(2)
 let l3 = ListNode(0)
 let l4 = ListNode(-4)
 l1.next = l2
 l2.next = l3
 l3.next = l4
 l4.next = l2
 print(hasCycle(l1))
 
## 笔记:
 快慢指针判断环
 相遇后慢指针回到起点,两个指针一起走,再次相遇的地方就是环入口
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */
import Foundation

func detectCycle(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    
    //快慢指针判断当前链表是否有环
    var fast = head
    var slow = head
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            break
        }
    }
    
    //注意这里是判断 fast
    if fast == nil || fast?.next == nil {
        return nil
    }
    
    //假设相遇时 slow 的长度是 k, 那么 fast 的长度就是 2k
    //fast - slow = k, 而 fast 比 slow 多的这一段, 其实就是在环内转圈圈, 所以 k 就是环长度
    //假设环入口到相遇的长度是 m, 那对 slow 来讲, k - m 就是从起点到环入口的长度
    //而对此时已经相遇的 fast 来讲, k - m 也是从相遇的这个点到环入口的长度
    //所以让此时的 slow 从头再走一次, 当 slow 和 fast 再次相遇的时候, 就是圆环的入口处
    slow = head
    while slow !== fast {
        slow = slow?.next
        fast = fast?.next
    }
    
    return slow
}
