//
//  524.通过删除字母匹配到字典里最长单词.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/1.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个字符串和一个字符串字典，找到字典里面最长的字符串，该字符串可以通过删除给定字符串的某些字符来得到。如果答案不止一个，返回长度最长且字典顺序最小的字符串。如果答案不存在，则返回空字符串。

 示例 1:

 输入:
 s = "abpcplea", d = ["ale","apple","monkey","plea"]

 输出:
 "apple"
 示例 2:

 输入:
 s = "abpcplea", d = ["a","b","c"]

 输出:
 "a"
 说明:

 所有输入的字符串只包含小写字母。
 字典的大小不会超过 1000。
 所有输入的字符串长度不会超过 1000。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-word-in-dictionary-through-deleting
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(findLongestWord("abpcplea", ["ale","apple","monkey","plea"]))

## 笔记
 这道题的思路还是很清晰的
 第一步找出是不是子串
 第二部找出是不是长度最长且字典顺序最小的
 
 需要注意的就两点
 第一是找子串的双指针逻辑
 第二是要字典顺序最小,而不是下标最小
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func findLongestWord(_ s: String, _ d: [String]) -> String {
    if s.count == 0 {
        return ""
    }
    //结果暂时存储为 字符的数组 方便后面比较
    var resArr: [Character] = [Character]()
    
    let arrS: [Character] = Array(s)
    
    for str in d {
        let arr: [Character] = Array(str)
        //这里需要两个索引来查找子串
        var targetIndex = 0
        var index: Int = 0
        while index < arr.count && targetIndex < arrS.count {
            let c: Character = arr[index]
            //字符c不符合就 targetIndex += 1
            //字符c符合就两个都 += 1
            if c == arrS[targetIndex] {
                index += 1
            }
            
            targetIndex += 1
        }
        
        //是子串的条件就是 index == arr.count
        if index == arr.count {
            if arr.count == resArr.count {
                //判断字典顺序
                for (i, c) in resArr.enumerated() {
                    if c < arr[i] {
                        break
                    } else if c > arr[i] {
                        resArr = arr
                    }
                }
            } else if arr.count > resArr.count {
                resArr = arr
            }
        }
    }
    
    return resArr.count == 0 ? "" : String.init(resArr[0..<resArr.count])
}

