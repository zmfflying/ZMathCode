//
//  221.最大正方形.swift
//  ZMathCode
//
//  Created by QZD on 2021/11/18.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 在一个由 '0' 和 '1' 组成的二维矩阵内，找到只包含 '1' 的最大正方形，并返回其面积。

 示例 1：

 输入：matrix = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
 输出：4
 示例 2：


 输入：matrix = [["0","1"],["1","0"]]
 输出：1
 示例 3：

 输入：matrix = [["0"]]
 输出：0
  

 提示：

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 300
 matrix[i][j] 为 '0' 或 '1'

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximal-square
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(maximalSquare([["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func maximalSquare(_ matrix: [[Character]]) -> Int {
    let m = matrix.count
    let n = matrix[0].count
    var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: n), count: m)
    var result = 0;
    for i in 0..<m {
        for j in 0..<n {
            if matrix[i][j] == "1" {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    //dp[i][j] 表示以(i, j)为右下角的正方形的最大边长
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                }
                result = max(result, dp[i][j])
            }
        }
    }
    
    return result * result
}
