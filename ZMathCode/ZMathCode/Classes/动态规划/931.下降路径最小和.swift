//
//  931.下降路径最小和.swift
//  ZMathCode
//
//  Created by QZD on 2021/11/19.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个 n x n 的 方形 整数数组 matrix ，请你找出并返回通过 matrix 的下降路径 的 最小和 。

 下降路径 可以从第一行中的任何元素开始，并从每一行中选择一个元素。在下一行选择的元素和当前行所选元素最多相隔一列（即位于正下方或者沿对角线向左或者向右的第一个元素）。具体来说，位置 (row, col) 的下一个元素应当是 (row + 1, col - 1)、(row + 1, col) 或者 (row + 1, col + 1) 。

  

 示例 1：

 输入：matrix = [[2,1,3],[6,5,4],[7,8,9]]
 输出：13
 解释：下面是两条和最小的下降路径，用加粗+斜体标注：
 [[2,1,3],      [[2,1,3],
  [6,5,4],       [6,5,4],
  [7,8,9]]       [7,8,9]]
 示例 2：

 输入：matrix = [[-19,57],[-40,-5]]
 输出：-59
 解释：下面是一条和最小的下降路径，用加粗+斜体标注：
 [[-19,57],
  [-40,-5]]
 示例 3：

 输入：matrix = [[-48]]
 输出：-48
  

 提示：

 n == matrix.length
 n == matrix[i].length
 1 <= n <= 100
 -100 <= matrix[i][j] <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-falling-path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func minFallingPathSum(_ matrix: [[Int]]) -> Int {
    if matrix.count == 0 {
        return 0
    }

    if matrix.count == 1 {
        return matrix[0].min()!
    }

    let m = matrix.count
    let n = matrix[0].count

    var dp: [[Int]] = matrix
    for i in 1..<m {
        for j in 0..<n {
            var tmpNum = dp[i-1][j]
            if j + 1 < n {
                tmpNum = min(tmpNum, dp[i-1][j+1])
            }

            if j - 1 >= 0 {
                tmpNum = min(tmpNum, dp[i-1][j-1])
            }

            dp[i][j] += tmpNum
        }
    }

    return dp.last!.min()!
}

//func minFallingPathSum(_ matrix: [[Int]]) -> Int {
//    if matrix.count == 0 {
//        return 0
//    }
//
//    if matrix.count == 1 {
//        return matrix[0].min()!
//    }
//
//    let m = matrix.count
//    let n = matrix[0].count
//
//    var dp: [Int] = matrix[0]
//    for i in 1..<m {
//        let tmpDp = dp
//        for j in 0..<n {
//            var tmpNum = tmpDp[j]
//            if j + 1 < n {
//                tmpNum = min(tmpNum, tmpDp[j+1])
//            }
//
//            if j > 0 {
//                tmpNum = min(tmpNum, tmpDp[j-1])
//            }
//
//            dp[j] = tmpNum + matrix[i][j]
//        }
//    }
//
//    return dp.min()!
//}
