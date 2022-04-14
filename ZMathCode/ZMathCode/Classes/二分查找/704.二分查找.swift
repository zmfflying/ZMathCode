//
//  704.二分查找.swift
//  ZMathCode
//
//  Created by QZD on 2022/4/12.
//  Copyright © 2022 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。


 示例 1:

 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 示例 2:

 输入: nums = [-1,0,3,5,9,12], target = 2
 输出: -1
 解释: 2 不存在 nums 中因此返回 -1
  

 提示：

 你可以假设 nums 中的所有元素是不重复的。
 n 将在 [1, 10000]之间。
 nums 的每个元素都将在 [-9999, 9999]之间。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-search
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print(search([-1,0,3,5,9,12], 9))
 
## 笔记

 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */
import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return -1
    }
    var leftIndex: Int = 0
    var rightIndex: Int = nums.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex: Int = leftIndex + (rightIndex - leftIndex) / 2
        if nums[middleIndex] == target {
            return middleIndex
        } else if nums[middleIndex] < target {
            leftIndex = middleIndex + 1
        } else if nums[middleIndex] > target {
            rightIndex = middleIndex - 1
        }
    }
    return -1
}
