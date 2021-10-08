//
//  5.最长回文子串.swift
//  ZMathCode
//
//  Created by QZD on 2021/10/8.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个字符串 s，找到 s 中最长的回文子串。

 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
 示例 3：

 输入：s = "a"
 输出："a"
 示例 4：

 输入：s = "ac"
 输出："a"
  

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母（大写和/或小写）组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(longestPalindrome("babad"))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func longestPalindrome(_ s: String) -> String {
    let len = s.count
    if len < 2 {
        return s
    }
    
    var maxBegin = 0
    var maxEnd = 0
    var maxLen = 1
    var dp: [[Bool]] = [[Bool]].init(repeating: [Bool].init(repeating: false, count: len), count: len)
    
    let arr = Array(s)
    for r in 1..<len {
        for l in 0..<r {
            //当 (r-1) - (l+1) + 1 < 2 的时候,就是代表只有一个字符
            //转换公式得 r - l < 3
            if arr[r] == arr[l] && (r - l < 3 || dp[l+1][r-1]) {
                dp[l][r] = true
                
                if r - l + 1 > maxLen {
                    maxLen = r - l + 1
                    maxBegin = l
                    maxEnd = r
                }
            }
        }
    }
    
    return String(arr[maxBegin...maxEnd])
}
