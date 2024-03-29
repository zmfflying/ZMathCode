//
//  695.岛屿的最大面积.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/28.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个大小为 m x n 的二进制矩阵 grid 。

 岛屿 是由一些相邻的 1 (代表土地) 构成的组合，这里的「相邻」要求两个 1 必须在 水平或者竖直的四个方向上 相邻。你可以假设 grid 的四个边缘都被 0（代表水）包围着。

 岛屿的面积是岛上值为 1 的单元格的数目。

 计算并返回 grid 中最大的岛屿面积。如果没有岛屿，则返回面积为 0 。

  

 示例 1：


 输入：grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
 输出：6
 解释：答案不应该是 11 ，因为岛屿只能包含水平或垂直这四个方向上的 1 。
 示例 2：

 输入：grid = [[0,0,0,0,0,0,0,0]]
 输出：0
  

 提示：

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] 为 0 或 1


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/max-area-of-island
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print(maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var result: Int = 0
    var arr: [[Int]] = grid

    let m: Int = grid.count
    let n: Int = grid[0].count

    var tempNum: Int = 0
    for i in 0..<m {
        for j in 0..<n {
            //第一步,找
            tempNum = 0
            p_helpMaxAreaOfIsland(i: i, j: j)
            result = max(result, tempNum)
        }
    }


    func p_helpMaxAreaOfIsland(i: Int, j: Int) {
        if i < 0 || j < 0 || i >= m || j >= n || arr[i][j] == 0 {
            return
        }
        arr[i][j] = 0
        tempNum += 1
        
        p_helpMaxAreaOfIsland(i: i+1, j: j)
        p_helpMaxAreaOfIsland(i: i-1, j: j)
        p_helpMaxAreaOfIsland(i: i, j: j+1)
        p_helpMaxAreaOfIsland(i: i, j: j-1)
    }

    return result
}
