//
//  560.和为 K 的子数组.swift
//  ZMathCode
//
//  Created by QZD on 2022/1/10.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个整数数组 nums 和一个整数 k ，请你统计并返回该数组中和为 k 的连续子数组的个数。

  

 示例 1：

 输入：nums = [1,1,1], k = 2
 输出：2
 示例 2：

 输入：nums = [1,2,3], k = 3
 输出：2
  

 提示：

 1 <= nums.length <= 2 * 104
 -1000 <= nums[i] <= 1000
 -107 <= k <= 107


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subarray-sum-equals-k
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(subarraySum([1,1,1], 2))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//暴力解法
//func subarraySum(_ nums: [Int], _ k: Int) -> Int {
//    var result = 0
//    for i in 0..<nums.count {
//        var curSum = 0
//        for j in i..<nums.count {
//            curSum += nums[j]
//            if curSum == k {
//                result += 1
//            }
//        }
//    }
//
//    return result
//}

//前缀和
//func subarraySum(_ nums: [Int], _ k: Int) -> Int {
//    var result = 0
//    var preNums: [Int] = [Int].init(repeating: 0, count: nums.count + 1)
//    preNums[0] = 0
//    for i in 0..<nums.count {
//        preNums[i+1] = preNums[i] + nums[i]
//    }
//
//    for i in 0..<nums.count {
//        for j in i..<nums.count {
//            if preNums[j+1] - preNums[i] == k {
//                result += 1
//            }
//        }
//    }
//    return result
//}

//前缀和 + 哈希表
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    var map: [Int: Int] = [0 : 1]
    var preSum = 0
    for i in 0..<nums.count {
        preSum += nums[i]
        //如果需要的值 preSum - k 之前已经在map中
        //代表本次就是满足的
        if let preCount = map[preSum - k] {
            count += preCount
        }
        
        //维护 map
        if let pre = map[preSum] {
            map[preSum] = pre + 1
        } else {
            map[preSum] = 1
        }
    }
    
    return count
}
