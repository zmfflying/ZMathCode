//
//  240.搜索二维矩阵II.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/5.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target 。该矩阵具有以下特性：

 每行的元素从左到右升序排列。
 每列的元素从上到下升序排列。
  
 示例 1：

 输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
 输出：true
 示例 2：

 输入：matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
 输出：false
  

 提示：

 m == matrix.length
 n == matrix[i].length
 1 <= n, m <= 300
 -109 <= matix[i][j] <= 109
 每行的所有元素从左到右升序排列
 每列的所有元素从上到下升序排列
 -109 <= target <= 109

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-a-2d-matrix-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(searchMatrix([[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], 5))

## 笔记
 这道题最容易想到的就是暴力解法,直接遍历每一行
 
 还有个很巧妙的思路是
 根据矩阵从左到右升序排列,从上到下升序排列的特性
 从左下角开始取值
 取出的这个值,代表着这一行的最小值和这一列的最大值
 
 当前值小于目标值的话,那就说明这一列上面的值肯定都小于,所以往右走
 当前值大于目标值的话,那就说明这一行右边的值肯定都大于,所以往上走
 一直遍历到所有元素都不满足即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    //从左下角开始 i是行  j是列
    var i = matrix.count - 1
    var j = 0
    
    //循环结束条件就是 i 和 j 的值有效
    while i >= 0 && j < matrix[i].count {
        //当前值代表着这一行的最小值和这一列的最大值
        let num = matrix[i][j]
        
        //当前值小于目标值,说明元素可能存在于本行的后面,往右走
        if num < target  {
            j += 1
        } else if num > target {
        //当前值大于目标值,说明元素不可能存在于本行
        //但是可能存在于本列,往上走
            i -= 1
        } else {
            return true
        }
    }
    
    return false
}

//暴力解法
//func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//    for nums in matrix {
//        if nums.count > 0 && nums.first! <= target && nums.last! >= target {
//            let set: Set<Int> = Set<Int>(nums)
//            if set.contains(target) {
//                return true
//            }
//        }
//    }
//    return false
//}
