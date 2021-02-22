//
//  53.最大子序和.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/20.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 示例 1：

 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：

 输入：nums = [1]
 输出：1
 示例 3：

 输入：nums = [0]
 输出：0
 示例 4：

 输入：nums = [-1]
 输出：-1
 示例 5：

 输入：nums = [-100000]
 输出：-100000
  

 提示：

 1 <= nums.length <= 3 * 104
 -105 <= nums[i] <= 105
  

 进阶：如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的 分治法 求解。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))

## 笔记
 这道题的思路就是
 在循环中
 前面的最大值大于0就加上本次的值得到本次最大值
 前面的最大值小于0的话,本次最大值就是当前值
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var temp = nums[0]
    var res = temp
    
    for index in 1..<nums.count {
        let curNum = nums[index]
        //这一步是找到本次循环的最大值
        //如果前面的最大值大于0就加上
        //不然本次循环最大值就是当前值
        temp = max(curNum, curNum + temp)
        
        //这一步是找到最终的结果
        res = max(res, temp)
    }
    return res
}
