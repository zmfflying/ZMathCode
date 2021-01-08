//
//  392.判断子序列.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/8.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 给定字符串 s 和 t ，判断 s 是否为 t 的子序列。
 字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。
 进阶：
 如果有大量输入的 S，称作 S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？
 致谢：
 特别感谢 @pbrother 添加此问题并且创建所有测试用例。
 
 示例 1：

 输入：s = "abc", t = "ahbgdc"
 输出：true
 示例 2：

 输入：s = "axc", t = "ahbgdc"
 输出：false
 
 提示：

 0 <= s.length <= 100
 0 <= t.length <= 10^4
 两个字符串都只由小写字符组成。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/is-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(isSubsequence("abc", "ahbgdc"))

## 笔记
 这道题的思路和 455.分发饼干 的一样
 就每次循环都进行比对 对得上就都后移
 对不上就原始字符串后移
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func isSubsequence(_ s: String, _ t: String) -> Bool {
    let child:[Character] = Array(s)
    let parent:[Character] = Array(t)
    var childIndex: Int = 0
    var parentIndex: Int = 0
    
    while childIndex < child.count && parentIndex < parent.count {
        if child[childIndex] == parent[parentIndex] {
            childIndex += 1
            parentIndex += 1
        } else {
            parentIndex += 1
        }
    }
    
    if childIndex == child.count {
        return true
    }
    return false
}
