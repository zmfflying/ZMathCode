//
//  389.找不同.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/25.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定两个字符串 s 和 t，它们只包含小写字母。

 字符串 t 由字符串 s 随机重排，然后在随机位置添加一个字母。

 请找出在 t 中被添加的字母。


 示例 1：

 输入：s = "abcd", t = "abcde"
 输出："e"
 解释：'e' 是那个被添加的字母。
 示例 2：

 输入：s = "", t = "y"
 输出："y"
 示例 3：

 输入：s = "a", t = "aa"
 输出："a"
 示例 4：

 输入：s = "ae", t = "aea"
 输出："a"
  

 提示：

 0 <= s.length <= 1000
 t.length == s.length + 1
 s 和 t 只包含小写字母

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-the-difference
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(findTheDifference("ae", "aea"))

## 笔记
 这道题用ASCII码更快
 
 也可以利用 hash 表查找 o(1)的特性去做
 字符为key  个数为value
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func findTheDifference(_ s: String, _ t: String) -> Character {
    if s.count == 0 {
        return Character.init(t)
    }
    
    var dic: [Character: Int] = [Character: Int]()

    for c in Array(s) {
        dic[c] = dic[c] == nil ? 1 : (dic[c]! + 1)
    }

    for c in Array(t) {
        if dic[c] != nil {
            let count = dic[c]! - 1
            dic[c] = count == 0 ? nil : count
        } else {
            return c
        }
    }
    return "a"
}

//用ASCII码更快
//func findTheDifference(_ s: String, _ t: String) -> Character {
//    var sum1: UInt32 = 0, sum2: UInt32 = 0
//    for v in s.unicodeScalars {
//        sum1 += v.value
//    }
//    for v in t.unicodeScalars {
//        sum2 += v.value
//    }
//
//    return Character(Unicode.Scalar(sum2 - sum1)!)
//}
