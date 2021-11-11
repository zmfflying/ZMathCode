//
//  139.单词拆分.swift
//  ZMathCode
//
//  Created by QZD on 2021/10/8.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 给定一个非空字符串 s 和一个包含非空单词的列表 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。

 说明：

 拆分时可以重复使用字典中的单词。
 你可以假设字典中没有重复的单词。
 示例 1：

 输入: s = "leetcode", wordDict = ["leet", "code"]
 输出: true
 解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。
 示例 2：

 输入: s = "applepenapple", wordDict = ["apple", "pen"]
 输出: true
 解释: 返回 true 因为 "applepenapple" 可以被拆分成 "apple pen apple"。
      注意你可以重复使用字典中的单词。
 示例 3：

 输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-break
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(wordBreak("leetcode", ["leet", "code"]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let arr: [Character] = Array(s)
    
    var maxLength = 0
    var wordDictSet: Set<[Character]> = Set<[Character]>.init()
    for str in wordDict {
        maxLength = max(maxLength, str.count)
        wordDictSet.insert(Array(str))
    }

    var dp: [Bool] = [Bool].init(repeating: false, count: arr.count + 1)
    dp[0] = true

    for i in 1...arr.count {
        let startIndex = max(0, i-maxLength)
        for j in startIndex..<i {
            if dp[j] && wordDictSet.contains(Array(arr[j..<i])) {
                dp[i] = true
                break
            }
        }
    }

    return dp.last!
}
