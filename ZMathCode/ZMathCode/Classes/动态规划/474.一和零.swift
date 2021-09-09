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

func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    var dp: [[[Int]]] = [[[Int]]].init(repeating: [[Int]].init(repeating: [Int].init(repeating: 0, count: n + 1), count: m + 1), count: strs.count)
    var result: Int = 0
    for i in 0..<strs.count {
        let str = strs[i]
        var temp0 = 0
        var temp1 = 0
        let arr: [Character] = Array(str)
        for c in arr {
            if c == "0" {
                temp0 += 1
            } else if c == "1" {
                temp1 += 1
            }
        }
        
        var curDp: [[Int]] = dp[i]
        if i == 0 {
            if temp0 <= m && temp1 <= n {
                for k in temp0...m {
                    for h in temp1...n {
                        curDp[k][h] = 1
                    }
                }
                result = 1
            }
        } else {
            for j in 1...i {
                if temp0 <= m && temp1 <= n {
                    let preDp: [[Int]] = dp[j]
                    for k in temp0...m {
                        for h in temp1...n {
                            curDp[k][h] = max(curDp[k][h], preDp[k][h] + 1)
                            result = max(result, curDp[k][h])
                        }
                    }
                }
            }
        }
        
        dp[i] = curDp
    }
    return result
}
