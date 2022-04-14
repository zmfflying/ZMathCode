//
//  69.x的平方根.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/14.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个非负整数 x ，计算并返回 x 的 算术平方根 。

 由于返回类型是整数，结果只保留 整数部分 ，小数部分将被 舍去 。

 注意：不允许使用任何内置指数函数和算符，例如 pow(x, 0.5) 或者 x ** 0.5 。

  

 示例 1：

 输入：x = 4
 输出：2
 示例 2：

 输入：x = 8
 输出：2
 解释：8 的算术平方根是 2.82842..., 由于返回类型是整数，小数部分将被舍去。
  

 提示：

 0 <= x <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print(mySqrt(4))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func mySqrt(_ x: Int) -> Int {
    if x == 0 || x == 1 {
        return x
    }
    
    var left: Int = 0
    var right: Int = x / 2
    var middle: Int = left + (right - left) / 2
    
    while left <= right {
        if middle * middle == x  {
            return middle
        } else if middle * middle < x {
            left = middle + 1
        } else if middle * middle > x {
            right = middle - 1
        }
        middle = left + (right - left) / 2
    }
    
    return min(left, right)
}
