//
//  140. 单词拆分II.swift
//  ZMathCode
//
//  Created by QZD on 2021/10/20.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个非空字符串 s 和一个包含非空单词列表的字典 wordDict，在字符串中增加空格来构建一个句子，使得句子中所有的单词都在词典中。返回所有这些可能的句子。

 说明：

 分隔时可以重复使用字典中的单词。
 你可以假设字典中没有重复的单词。
 示例 1：

 输入:
 s = "catsanddog"
 wordDict = ["cat", "cats", "and", "sand", "dog"]
 输出:
 [
   "cats and dog",
   "cat sand dog"
 ]
 示例 2：

 输入:
 s = "pineapplepenapple"
 wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
 输出:
 [
   "pine apple pen apple",
   "pineapple pen apple",
   "pine applepen apple"
 ]
 解释: 注意你可以重复使用字典中的单词。
 示例 3：

 输入:
 s = "catsandog"
 wordDict = ["cats", "dog", "sand", "and", "cat"]
 输出:
 []

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/word-break-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(wordBreak1("catsanddog", ["cat", "cats", "and", "sand", "dog"]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//动态规划
//func wordBreak1(_ s: String, _ wordDict: [String]) -> [String] {
//    let arr: [Character] = Array(s)
//    var maxLength = 0
//    var wordDictSet: Set<[Character]> = Set<[Character]>.init()
//    for str in wordDict {
//        maxLength = max(maxLength, str.count)
//        wordDictSet.insert(Array(str))
//    }
//
//    var dp: [Set<[Character]>] = [Set<[Character]>].init(repeating: Set<[Character]>.init(), count: arr.count + 1)
//
//    for i in 1...arr.count {
//        let startIndex = max(0, i-maxLength)
//        for j in startIndex..<i {
//            let curArr: [Character] = Array(arr[j..<i])
//            if wordDictSet.contains(curArr) {
//                if j == 0 {
//                    dp[i].insert(curArr)
//                } else {
//                    for tmpArr in dp[j] {
//                        var arrm = tmpArr
//                        arrm.append(" ")
//                        arrm.append(contentsOf: curArr)
//                        dp[i].insert(arrm)
//                    }
//                }
//            }
//        }
//    }
//    if dp.last?.count == 0 {
//        return []
//    }
//
//    var result: [String] = [String].init()
//    for tmpArr in dp.last! {
//        result.append(String(tmpArr[0..<tmpArr.count]))
//    }
//
//    return result
//}

//回溯
//func wordBreak1(_ s: String, _ wordDict: [String]) -> [String] {
//    let arr: [Character] = Array(s)
//    var maxLength = 0
//    var minLength = wordDict.first!.count
//    var wordDictSet: Set<[Character]> = Set<[Character]>.init()
//    for str in wordDict {
//        maxLength = max(maxLength, str.count)
//        minLength = min(minLength, str.count)
//        wordDictSet.insert(Array(str))
//    }
//    var result: [String] = [String].init()
//
//    func findResultStr(leftIndex: Int, rightIndex: Int, curArr:[Character]) {
//        let len: Int = rightIndex - leftIndex + 1
//        if len > maxLength || leftIndex < 0 {
//            return
//        }
//
//        if len >= minLength {
//            var tmpArr: [Character] = Array(arr[leftIndex...rightIndex])
//            if wordDictSet.contains(tmpArr) {
//                if curArr.count > 0 {
//                    tmpArr.append(" ")
//                }
//                tmpArr.append(contentsOf: curArr)
//                if leftIndex == 0 {
//                    result.append(String(tmpArr[0..<tmpArr.count]))
//                    return
//                }
//                findResultStr(leftIndex: leftIndex - 1, rightIndex: leftIndex-1, curArr: tmpArr)
//                findResultStr(leftIndex: leftIndex - 1, rightIndex: rightIndex, curArr: curArr)
//                return
//            }
//        }
//
//        findResultStr(leftIndex: leftIndex - 1, rightIndex: rightIndex, curArr: curArr)
//    }
//
//    findResultStr(leftIndex: arr.count - 1, rightIndex: arr.count - 1, curArr: [Character].init())
//
//    return result
//}

//动态规划 + 回溯
func wordBreak1(_ s: String, _ wordDict: [String]) -> [String] {
    let arr: [Character] = Array(s)
    var maxLength = 0
    var minLength = wordDict.first!.count
    var wordDictSet: Set<[Character]> = Set<[Character]>.init()
    for str in wordDict {
        maxLength = max(maxLength, str.count)
        minLength = min(minLength, str.count)
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

    //动态规划判断能不能被拆分
    if dp.last == false {
        return []
    }
    
    var result: [String] = [String].init()
    
    //回溯找到具体的值
    func findResultStr(leftIndex: Int, rightIndex: Int, curArr:[Character]) {
        let len: Int = rightIndex - leftIndex + 1
        if len > maxLength || leftIndex < 0 {
            return
        }
        
        if len >= minLength {
            var tmpArr: [Character] = Array(arr[leftIndex...rightIndex])
            if wordDictSet.contains(tmpArr) {
                if curArr.count > 0 {
                    tmpArr.append(" ")
                }
                tmpArr.append(contentsOf: curArr)
                if leftIndex == 0 {
                    result.append(String(tmpArr[0..<tmpArr.count]))
                    return
                }
                findResultStr(leftIndex: leftIndex - 1, rightIndex: leftIndex-1, curArr: tmpArr)
                findResultStr(leftIndex: leftIndex - 1, rightIndex: rightIndex, curArr: curArr)
                return
            }
        }
        
        findResultStr(leftIndex: leftIndex - 1, rightIndex: rightIndex, curArr: curArr)
    }
    
    findResultStr(leftIndex: arr.count - 1, rightIndex: arr.count - 1, curArr: [Character].init())
    
    return result
}
