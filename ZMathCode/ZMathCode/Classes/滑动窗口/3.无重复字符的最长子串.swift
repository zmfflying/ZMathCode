//
//  3.无重复字符的最长子串.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/11.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 示例 4:

 输入: s = ""
 输出: 0
  

 提示：

 0 <= s.length <= 5 * 104
 s 由英文字母、数字、符号和空格组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(lengthOfLongestSubstring("pwwkew"))

## 笔记
 这道题用滑动窗口的思想就是要维护窗口的正确性
 保证窗口里的数据是不重复的
 最终取整个循环过程中窗口的历史最大值即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var res: Int = 0
    //窗口
    var path: [Character] = [Character]()
    
    for c in Array(s) {
        //维护窗口数据的准确
        if let index = path.firstIndex(of: c) {
            path.removeSubrange(Range.init(NSMakeRange(0, index+1))!)
        }
        //走到这里 path里肯定已经没有c了
        path.append(c)
        //取res的值
        res = max(res, path.count)
    }

    return res
}

//这种方法更快 但不是很好理解
//func lengthOfLongestSubstring(_ s: String) -> Int {
//    var res: Int = 0
//    var dic: [Character: Int] = [Character: Int]()
//    var start: Int = 0
//    let arr = Array(s)
//    var end: Int = 0
//    let count = arr.count
//
//    while end < count && start < count {
//        let c = arr[end]
//        if dic[c] != nil {
//            start = max(start, dic[c]!)
//        }
//        end += 1
//        res = max(res, end - start)
//        dic[c] = end
//    }
//
//    return res
//}
