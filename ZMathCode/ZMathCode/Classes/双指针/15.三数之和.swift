//
//  15.三数之和.swift
//  ZMathCode
//
//  Created by zmfflying on 2023/4/28.
//  Copyright © 2023 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请

 你返回所有和为 0 且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

  

  

 示例 1：

 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 解释：
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0 。
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0 。
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0 。
 不同的三元组是 [-1,0,1] 和 [-1,-1,2] 。
 注意，输出的顺序和三元组的顺序并不重要。
 示例 2：

 输入：nums = [0,1,1]
 输出：[]
 解释：唯一可能的三元组和不为 0 。
 示例 3：

 输入：nums = [0,0,0]
 输出：[[0,0,0]]
 解释：唯一可能的三元组和为 0 。
  

 提示：

 3 <= nums.length <= 3000
 -105 <= nums[i] <= 105

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/3sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(threeSum([-1,0,1,2,-1,-4]))

## 笔记
 这道题的核心就是 排序+双指针
 难点是 去重
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    let sortNums: [Int] = nums.sorted(by: <)
    var result: [[Int]] = [[Int]]()
    let count: Int = sortNums.count
    
    for index in 0..<count {
        //去重
        if index > 0, sortNums[index] == sortNums[index-1] {
            continue
        }
        
        var left = index + 1
        var right = count - 1
        while left < right {
            let sum = sortNums[index] + sortNums[left] + sortNums[right]
            if sum == 0 {
                result.append([sortNums[index], sortNums[left], sortNums[right]])
                //去重
                while left < right, sortNums[left] == sortNums[left+1]  {
                    left += 1
                }
                //去重
                while left < right, sortNums[right] == sortNums[right-1]  {
                    right -= 1
                }
                left += 1
                right -= 1
                
            } else if sum < 0 {
                left += 1
            } else if sum > 0 {
                right -= 1
            }
        }
    }
    
    return result
}

//func threeSum(_ nums: [Int]) -> [[Int]] {
//    let sortNums: [Int] = nums.sorted(by: <)
//    var result: Set<[Int]> = Set<[Int]>()
//    for index in 0..<sortNums.count {
//        var left = index + 1
//        var right = sortNums.count - 1
//        while left < right {
//            let sum = sortNums[index] + sortNums[left] + sortNums[right]
//            if sum == 0 {
//                result.insert([sortNums[index], sortNums[left], sortNums[right]])
//                left += 1
//            } else if sum < 0 {
//                left += 1
//            } else if sum > 0 {
//                right -= 1
//            }
//        }
//    }
//
//    return Array(result)
//}
