//
//  198.打家劫舍.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/25.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

 给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。

  

 示例 1：

 输入：[1,2,3,1]
 输出：4
 解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
      偷窃到的最高金额 = 1 + 3 = 4 。
 示例 2：

 输入：[2,7,9,3,1]
 输出：12
 解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
      偷窃到的最高金额 = 2 + 9 + 1 = 12 。
  

 提示：

 0 <= nums.length <= 100
 0 <= nums[i] <= 400

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/house-robber
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(rob([1,2,3,1]))

## 笔记
 这道题就是很经典的动态规划的思路了
 保证之前每一家都是当前可以得到的最大收益
 然后计算出当前的最大收益
 
 优化后的思路是
 即使
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

//原始思路
func rob(_ nums: [Int]) -> Int {
    let count = nums.count

    //因为不能相邻 所以0和1提前处理掉
    if count == 0 {
        return 0
    }
    if count == 1 {
        return nums.last!
    }

    //记录每一家可以获得的最大收益
    var dp: [Int] = nums

    for i in 2..<count {
        var temp = 0
        var j = 2
        while i - j >= 0 {
            //计算每一家的最大收益需要和前面所有不相邻的都进行计算
            temp = max(temp, nums[i] + dp[i - j])
            j += 1
        }
        dp[i] = temp
    }
    //这样 最大值必定在最后两个之中
    return max(dp[count - 1], dp[count - 2])
}


//优化: 哪怕不抢当前房屋,也要保证每一家都是当前可以获得的最大收益
//比如 nums = [2,1], 那么dp[1] = 2
func rob1(_ nums: [Int]) -> Int {
    let count = nums.count
    
    //因为不能相邻 所以0和1提前处理掉
    if count == 0 {
        return 0
    }
    if count == 1 {
        return nums[count-1]
    }
    
    //记录每一家可以获得的最大收益
    var dp: [Int] = [Int].init(repeating: 0, count: count)
    dp[0] = nums[0]
    //保证每一家都是当前可以获得的最大收益
    //比如 nums = [2,1], 那么dp[1] = 2
    dp[1] = max(nums[0], nums[1])
    
    for i in 2..<count {
        dp[i] = max(dp[i-1], dp[i-2] + nums[i])
    }
    
    return dp[count-1]
}
