//
//  146.LRU 缓存机制.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/26.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制 。
 实现 LRUCache 类：

 LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
 int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
 void put(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
  
 进阶：你是否可以在 O(1) 时间复杂度内完成这两种操作？

 示例：

 输入
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 输出
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 解释
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // 缓存是 {1=1}
 lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 lRUCache.get(1);    // 返回 1
 lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 lRUCache.get(2);    // 返回 -1 (未找到)
 lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 lRUCache.get(1);    // 返回 -1 (未找到)
 lRUCache.get(3);    // 返回 3
 lRUCache.get(4);    // 返回 4
  

 提示：

 1 <= capacity <= 3000
 0 <= key <= 3000
 0 <= value <= 104
 最多调用 3 * 104 次 get 和 put

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let lRUCache = LRUCache(2);
 lRUCache.put(1, 1); // 缓存是 {1=1}
 lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 print(lRUCache.get(1));    // 返回 1
 lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 print(lRUCache.get(2));    // 返回 -1 (未找到)
 lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 print(lRUCache.get(1));    // 返回 -1 (未找到)
 print(lRUCache.get(3));    // 返回 3
 print(lRUCache.get(4));    // 返回 4

## 笔记
 这道题用数组做的话代码就很简单,但是效率很低
 用双向链表做效率很高,但代码就相对复杂了一些
 
 逻辑都是一样的:
 一个字典存储 key value, 同时用来判断个数
 
 用一个数据结构根据活跃度来有序存储数据
 get和set都要增加活跃度
 当个数超出的时候,移除最不活跃的数据即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

//双向链表
class LRUCache {
    
    class Node {
        var key: Int?
        var value: Int?
        var prev: Node?
        var next: Node?
    }
    
    //记录下最大个数
    var maxCount: Int = 0
    //当前存储数据
    var dic: [Int: Node] = [Int: Node]()
    
    //辅助的 链表的头尾节点
    var head: Node = Node.init()
    var foot: Node = Node.init()
    
    init(_ capacity: Int) {
        maxCount = capacity
        head.next = foot
        foot.prev = head
    }
    
    func get(_ key: Int) -> Int {
        //get操作也要把 key对应的节点移到前面
        if let node = dic[key] {
            moveNodeToHead(node: node)
            return node.value!
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = dic[key] {
            node.value = value
            //put 把 key对应的节点移到前面
            moveNodeToHead(node: node)
        } else {
            let node = Node.init()
            node.key = key
            node.value = value
            //把 key对应的节点放在最前面
            node.next = head.next
            node.prev = head
            head.next?.prev = node
            head.next = node
            
            //注意要等 node 的前后节点都确定后才给 dic 赋值
            dic[key] = node
            
            if dic.count > maxCount {
                //移除最后的节点
                dic.removeValue(forKey: foot.prev!.key!)
                let temp = foot.prev?.prev
                temp?.next = foot
                foot.prev = temp
            }
        }
    }
    
    func moveNodeToHead(node: Node) {
        if head.next!.key == node.key {
            return
        }
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }
}

//数组 最简单  很慢
//class LRUCache {
//    var maxCount: Int = 0
//
//    var dic: [Int: Int] = [Int: Int]()
//    var arr: [Int] = [Int]()
//
//    init(_ capacity: Int) {
//        maxCount = capacity
//    }
//
//    func get(_ key: Int) -> Int {
//        if let value = dic[key] {
//            if let index = arr.firstIndex(of: key) {
//                arr.remove(at: index)
//            }
//            arr.append(key)
//            return value
//        }
//        return -1
//    }
//
//    func put(_ key: Int, _ value: Int) {
//        if let index = arr.firstIndex(of: key) {
//            arr.remove(at: index)
//        }
//        arr.append(key)
//        if dic[key] == nil && dic.count == maxCount {
//            dic.removeValue(forKey: arr.removeFirst())
//        }
//        dic[key] = value
//    }
//}
