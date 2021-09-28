//
//  474.一和零.swift
//  ZMathCode
//
//  Created by QZD on 2021/6/2.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个二进制字符串数组 strs 和两个整数 m 和 n 。

 请你找出并返回 strs 的最大子集的大小，该子集中 最多 有 m 个 0 和 n 个 1 。

 如果 x 的所有元素也是 y 的元素，集合 x 是集合 y 的 子集 。

  

 示例 1：

 输入：strs = ["10", "0001", "111001", "1", "0"], m = 5, n = 3
 输出：4
 解释：最多有 5 个 0 和 3 个 1 的最大子集是 {"10","0001","1","0"} ，因此答案是 4 。
 其他满足题意但较小的子集包括 {"0001","1"} 和 {"10","1","0"} 。{"111001"} 不满足题意，因为它含 4 个 1 ，大于 n 的值 3 。
 示例 2：

 输入：strs = ["10", "0", "1"], m = 1, n = 1
 输出：2
 解释：最大的子集是 {"0", "1"} ，所以答案是 2 。
  

 提示：

 1 <= strs.length <= 600
 1 <= strs[i].length <= 100
 strs[i] 仅由 '0' 和 '1' 组成
 1 <= m, n <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/ones-and-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(longestCommonSubsequence("abcde", "ace"))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation
//二维数组
func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    var strCountArr: [[Int]] = [[Int]].init(repeating: [0, 0], count: strs.count)
    for i in 0..<strs.count {
        for c in strs[i] {
            if c == "0" {
                strCountArr[i][0] += 1
            } else if c == "1" {
                strCountArr[i][1] += 1
            }
        }
    }
    
    var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: n + 1), count: m + 1)
    for i in 0..<strs.count {
        //先记录下之前的数据,即 i-1 的数据
        let preDp = dp
        let temp0 = strCountArr[i][0]
        let temp1 = strCountArr[i][1]
        for j in 0...m {
            for k in 0...n {
                if j >= temp0 && k >= temp1 {
                    dp[j][k] = max(preDp[j][k], preDp[j-temp0][k-temp1] + 1)
                }
            }
        }
    }
    return dp[m][n]
}

//三维数组
//func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
//    var dp: [[[Int]]] = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: n + 1), count: m + 1), count: strs.count + 1)
//    var strCountArr: [[Int]] = [[Int]].init(repeating: [0, 0], count: strs.count)
//    for i in 0..<strs.count {
//        for c in strs[i] {
//            if c == "0" {
//                strCountArr[i][0] += 1
//            } else if c == "1" {
//                strCountArr[i][1] += 1
//            }
//        }
//    }
//
//    for i in 1...strs.count {
//        let temp0 = strCountArr[i-1][0]
//        let temp1 = strCountArr[i-1][1]
//        for j in 0...m {
//            for k in 0...n {
//                //注意这里要先赋值一次
//                dp[i][j][k] = dp[i - 1][j][k]
//                if j >= temp0 && k >= temp1 {
//                    dp[i][j][k] = max(dp[i-1][j][k], dp[i-1][j-temp0][k-temp1] + 1)
//                }
//
//            }
//        }
//    }
//    return dp[strs.count][m][n]
//}
