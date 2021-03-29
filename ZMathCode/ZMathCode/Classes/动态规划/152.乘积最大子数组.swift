//
//  152.乘积最大子数组.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/3/17.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

 示例 1:

 输入: [2,3,-2,4]
 输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 示例 2:

 输入: [-2,0,-1]
 输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-product-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(maxProduct([2,3,-2,4]))

## 笔记
 这道题的思路和 53.最大子序和 是差不多的
 都是一次循环计算最大值
 
 有区别的地方是这道题是要求乘积,而且数组里的元素有负数
 所以除了记录最大值外,还要记录最小值
 每次都去更新最大值和最小值即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    //这道题的特殊性在于有负数,在乘积中负负为正
    //所以除了记录最大值外,还要记录最小值
    var maxPro = nums[0]
    var res = maxPro
    var minPro = maxPro
    
    for i in 1..<nums.count {
        let num = nums[i]
        //这里需要用变量记录下最大值 maxPro
        //不然变化过的最大值 maxPro 参与最小值 minPro 的计算后会导致错误
        let tempMax = maxPro
        maxPro = max(num, max(tempMax * num, minPro * num))
        minPro = min(num, min(minPro * num, tempMax * num))
        res = max(maxPro, res)
    }
    
    return res
}
