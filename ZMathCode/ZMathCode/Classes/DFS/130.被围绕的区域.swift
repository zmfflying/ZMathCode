//
//  130.被围绕的区域.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/14.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个 m x n 的矩阵 board ，由若干字符 'X' 和 'O' ，找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
  

 示例 1：


 输入：board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
 输出：[["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
 解释：被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。
 示例 2：

 输入：board = [["X"]]
 输出：[["X"]]
  

 提示：

 m == board.length
 n == board[i].length
 1 <= m, n <= 200
 board[i][j] 为 'X' 或 'O'


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/surrounded-regions
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 var arr: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
 solve(&arr)
 print(arr)
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func solve(_ board: inout [[Character]]) {
    let m: Int = board.count
    let n: Int = board[0].count
    
    //第一步, 找出所有受到边界O影响的O 并做上标记(改为A)
    for i in 0..<m {
        for j in 0..<n {
            if i == 0 || i == m-1 || j == 0 || j == n-1 {
                p_func(&board, i: i, j: j)
            }
        }
    }
    
    //第二步, 遍历所有的元素
    //  所有被标记(A)的改为 O
    //  所有没被标记的改为 X
    for i in 0..<m {
        for j in 0..<n {
            if board[i][j] == "A" {
                board[i][j] = "O"
            } else if board[i][j] == "O" {
                board[i][j] = "X"
            }
        }
    }
    
    
    func p_func(_ board: inout [[Character]], i: Int, j: Int) {
        if i < 0 || j < 0 || i >= m || j >= n || board[i][j] != "O" {
            return
        }
        
        board[i][j] = "A"
        p_func(&board, i: i+1, j: j)
        p_func(&board, i: i-1, j: j)
        p_func(&board, i: i, j: j+1)
        p_func(&board, i: i, j: j-1)
    }
}
