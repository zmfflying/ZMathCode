//
//  873.最长的斐波那契子序列的长度.swift
//  ZMathCode
//
//  Created by QZD on 2021/12/20.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 如果序列 X_1, X_2, ..., X_n 满足下列条件，就说它是 斐波那契式 的：

 n >= 3
 对于所有 i + 2 <= n，都有 X_i + X_{i+1} = X_{i+2}
 给定一个严格递增的正整数数组形成序列 arr ，找到 arr 中最长的斐波那契式的子序列的长度。如果一个不存在，返回  0 。

 （回想一下，子序列是从原序列 arr 中派生出来的，它从 arr 中删掉任意数量的元素（也可以不删），而不改变其余元素的顺序。例如， [3, 5, 8] 是 [3, 4, 5, 6, 7, 8] 的一个子序列）

  

 示例 1：

 输入: arr = [1,2,3,4,5,6,7,8]
 输出: 5
 解释: 最长的斐波那契式子序列为 [1,2,3,5,8] 。
 示例 2：

 输入: arr = [1,3,7,11,12,14,18]
 输出: 3
 解释: 最长的斐波那契式子序列有 [1,11,12]、[3,11,14] 以及 [7,11,18] 。
  

 提示：

 3 <= arr.length <= 1000
 1 <= arr[i] < arr[i + 1] <= 10^9

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/length-of-longest-fibonacci-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(lenLongestFibSubseq([1,2,3,4,5,6,7,8]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//func lenLongestFibSubseq(_ arr: [Int]) -> Int {
//    let count: Int = arr.count
//    var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 2, count: count), count: count)
//    var map: [Int: Int] = [:]
//    for h in 0..<count {
//        map[arr[h]] = h
//    }
//
//    var result: Int = 0
//    for k in 0..<count {
//        let numK: Int = arr[k]
//        for j in 0..<k {
//            let numJ: Int = arr[j]
//            let numI: Int = numK - numJ
//            if let i: Int = map[numI], i < j {
//                dp[j][k] = max(dp[j][k], dp[i][j] + 1)
//            }
//
//            result = max(dp[j][k], result)
//        }
//    }
//
//    return result > 2 ? result : 0
//}

func lenLongestFibSubseq(_ arr: [Int]) -> Int {
    let count: Int = arr.count
    var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 2, count: count), count: count)
    var map: [Int: Int] = [:]
    for h in 0..<count {
        map[arr[h]] = h
    }

    var result: Int = 0
    for i in 0..<count {
        let numI: Int = arr[i]
        for j in i+1..<count {
            let numJ: Int = arr[j]
            let numK: Int = numJ - numI
            if let k: Int = map[numK], k < i {
                dp[i][j] = max(dp[i][j], dp[k][i] + 1)
            }

            result = max(dp[i][j], result)
        }
    }

    return result > 2 ? result : 0
}
