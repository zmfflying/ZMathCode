//
//  面试题17.13.恢复空格.swift
//  ZMathCode
//
//  Created by QZD on 2021/11/12.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 哦，不！你不小心把一个长篇文章中的空格、标点都删掉了，并且大写也弄成了小写。像句子"I reset the computer. It still didn’t boot!"已经变成了"iresetthecomputeritstilldidntboot"。在处理标点符号和大小写之前，你得先把它断成词语。当然了，你有一本厚厚的词典dictionary，不过，有些词没在词典里。假设文章用sentence表示，设计一个算法，把文章断开，要求未识别的字符最少，返回未识别的字符数。

 注意：本题相对原题稍作改动，只需返回未识别的字符数

  

 示例：

 输入：
 dictionary = ["looked","just","like","her","brother"]
 sentence = "jesslookedjustliketimherbrother"
 输出： 7
 解释： 断句后为"jess looked just like tim her brother"，共7个未识别字符。
 提示：

 0 <= len(sentence) <= 1000
 dictionary中总字符数不超过 150000。
 你可以认为dictionary和sentence中只包含小写字母。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/re-space-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(respace(["looked","just","like","her","brother"], "jesslookedjustliketimherbrother"))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

//动态规划 + 前缀树 
func respace(_ dictionary: [String], _ sentence: String) -> Int {

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
    }

    //边界处理
    if sentence.count == 0 {
        return 0
    }

    let root: Trie = Trie.init()
    for str in dictionary {
        root.insert(str)
    }

    let strArr: [Character] = Array(sentence)
    var dp: [Int] = [Int].init(repeating: 0, count: sentence.count + 1)

    for i in (0..<sentence.count).reversed() {
        var count = dp[i+1] + 1

        var tmpTrie: Trie? = root
        var j = i

        while j < strArr.count, tmpTrie != nil {
            tmpTrie = tmpTrie?.children[strArr[j]]
            if tmpTrie == nil {
                break
            }

            j += 1
            if tmpTrie!.isEnd == true {
                count = min(count, dp[j])
            }
        }

        dp[i] = count

    }

    return dp[0]
}

//纯动态规划 很慢很慢
//func respace(_ dictionary: [String], _ sentence: String) -> Int {
//    //边界处理
//    if sentence.count == 0 {
//        return 0
//    }
//    let strArr: [Character] = Array(sentence)
//
//    var minLength = dictionary.first!.count
//    var wordDictSet: Set<[Character]> = Set<[Character]>.init()
//    for str in dictionary {
//        minLength = min(minLength, str.count)
//        wordDictSet.insert(Array(str))
//    }
//
//    var dp: [Int] = [Int].init(repeating: 0, count: strArr.count + 1)
//
//    for i in 1...strArr.count {
//        dp[i] = dp[i-1] + 1
//
//        //边界处理
//        if i < minLength {
//            continue
//        }
//
//        //遍历字典
//        for tmpArr in wordDictSet {
//            if tmpArr.count <= i {
//                let curArr = Array(strArr[(i-tmpArr.count)..<i])
//                if wordDictSet.contains(curArr) {
//                    dp[i] = min(dp[i], dp[i-tmpArr.count])
//                }
//            }
//
//        }
//    }
//
//    return dp.last!
//}

