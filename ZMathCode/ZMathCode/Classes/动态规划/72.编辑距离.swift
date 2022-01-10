//
//  72.编辑距离.swift
//  ZMathCode
//
//  Created by QZD on 2021/12/21.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。

 你可以对一个单词进行如下三种操作：

 插入一个字符
 删除一个字符
 替换一个字符
  

 示例 1：

 输入：word1 = "horse", word2 = "ros"
 输出：3
 解释：
 horse -> rorse (将 'h' 替换为 'r')
 rorse -> rose (删除 'r')
 rose -> ros (删除 'e')
 示例 2：

 输入：word1 = "intention", word2 = "execution"
 输出：5
 解释：
 intention -> inention (删除 't')
 inention -> enention (将 'i' 替换为 'e')
 enention -> exention (将 'n' 替换为 'x')
 exention -> exection (将 'n' 替换为 'c')
 exection -> execution (插入 'u')
  

 提示：

 0 <= word1.length, word2.length <= 500
 word1 和 word2 由小写英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/edit-distance
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(minDistance("horse", "ros"))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func minDistance(_ word1: String, _ word2: String) -> Int {
    let len1 = word1.count
    let len2 = word2.count
    //边界处理
    if len1 * len2 == 0 {
        return len1 + len2
    }
    
    var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: len2 + 1), count: len1 + 1)
    
    //初始化的值
    /**
        ""  r   o   s
     "" 0   1   2   3
     h  1
     o  2
     r  3
     s  4
     e  5
     */
    for i in 0...len1 {
        dp[i][0] = i
    }
    
    for j in 0...len2 {
        dp[0][j] = j
    }
    
    let arr1 = Array(word1)
    let arr2 = Array(word2)
    
    for i in 1...len1 {
        let s1 = arr1[i-1]
        
        for j in 1...len2 {
            //dp[i][j] 表示 A 的前 i 个字母和 B 的前 j 个字母之间的最小编辑距离。
            //dp[i-1][j] 为 A 的前 i - 1 个字符和 B 的前 j 个字符编辑距离的子问题。即对于 A 的第 i 个字符，我们在 B 的末尾添加了一个相同的字符，那么 dp[i][j] 最小可以为 dp[i-1][j] + 1
            let left = dp[i-1][j] + 1
            
            //dp[i][j-1] 为 A 的前 i 个字符和 B 的前 j - 1 个字符编辑距离的子问题。即对于 B 的第 j 个字符，我们在 A 的末尾添加了一个相同的字符，那么 dp[i][j] 最小可以为 dp[i][j-1] + 1
            let top = dp[i][j-1] + 1
            
            //dp[i-1][j-1] 为 A 前 i - 1 个字符和 B 的前 j - 1 个字符编辑距离的子问题。即对于 B 的第 j 个字符，我们修改 A 的第 i 个字符使它们相同，那么 dp[i][j] 最小可以为 dp[i-1][j-1] + 1。
            //特别地，如果 A 的第 i 个字符和 B 的第 j 个字符原本就相同，那么我们实际上不需要进行修改操作。在这种情况下，dp[i][j] 最小可以为 dp[i-1][j-1]
            var left_top = dp[i-1][j-1]
            let s2 = arr2[j-1]
            if s1 != s2 {
                left_top += 1
            }
            //取三者的最小值
            dp[i][j] = min(left_top, min(left, top))
        }
    }
    
    return dp[len1][len2]
}
