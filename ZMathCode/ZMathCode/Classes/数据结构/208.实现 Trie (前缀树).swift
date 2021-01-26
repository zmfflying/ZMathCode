//
//  208.实现 Trie (前缀树).swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/26.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。

 示例:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // 返回 true
 trie.search("app");     // 返回 false
 trie.startsWith("app"); // 返回 true
 trie.insert("app");
 trie.search("app");     // 返回 true
 说明:

 你可以假设所有的输入都是由小写字母 a-z 构成的。
 保证所有输入均为非空字符串。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-trie-prefix-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 let trie = Trie();
 trie.insert("apple");
 print(trie.search("apple")) // 返回 true
 print(trie.search("app"))     // 返回 false
 print(trie.startsWith("app")) // 返回 true
 trie.insert("app");
 print(trie.search("app"))     // 返回 true

## 笔记
 这其实就是一个树结构
 在初始化之后 self 已经是一个节点了,最顶点的那个
 我用字典做的, 字母为key, 节点为 value
 那么字母传进来之后
 就去判断下个节点中有没有这个字母对应的节点的情况即可
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

class Trie {
    //这个字典是用来记录之后的节点 比如 ["a": Trie()]
    //Trie 本身没有值, 依赖 children 来判断关系
    var children: [Character: Trie] = [Character: Trie]()
    
    //isEnd 来记录当前是否是一个完整的句子
    var isEnd: Bool = false

    init() {}

    func insert(_ word: String) {
        //注意self 本身是一个节点
        var current = self
        for c in Array(word) {
            //这就是树结构
            if let next = current.children[c] {
                current = next
            } else {
                let next = Trie.init()
                current.children[c] = next
                current = next
            }
        }
        //走到这里 说明一个单词已经全部存储
        current.isEnd = true
    }

    func search(_ word: String) -> Bool {
        //注意self 本身是一个节点
        var current = self
        for c in Array(word) {
            //依赖 children 判断
            if let next = current.children[c] {
                current = next
            }else {
                return false
            }
        }
        //走到这里说明传进来的单词已经查询完毕
        // current 此时就是最后一个字母的节点
        return current.isEnd
    }

    func startsWith(_ prefix: String) -> Bool {
        //注意self 本身是一个节点
        var current = self
        for c in Array(prefix) {
            //依赖 children 判断
            if let next = current.children[c] {
                current = next
            }else {
                return false
            }
        }
        //不满足的情况前面已经 return 掉了
        return true
    }
}
