//
//  209.长度最小的子数组.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/8.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的 连续 子数组，并返回其长度。如果不存在符合条件的子数组，返回 0。
 示例：

 输入：s = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
 
 进阶：
 如果你已经完成了 O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-size-subarray-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(minSubArrayLen(7, [2,3,1,2,4,3]))

## 笔记
 这道题的核心就是维护这个滑动窗口
 在窗口里的和小于目标值的时候,不断的扩大窗口
 在和大于目标值之后,不断的缩小窗口
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    //当前滑块
    var path: [Int] = [Int]()
    //当前滑块的和
    var sum: Int = 0
    //滑块的开始和结束位置
    var start = 0
    var end = 0
    //最小长度
    var minLength = Int.max
    
    for num in nums {
        //外层循环 滑块右边每次都往后移
        path.append(num)
        sum += num
        end += 1
        
        while sum >= s {
            //找到最小长度
            minLength = min(minLength, end - start)
            //内层循环 滑块左边每次都往后移
            sum -= path[start]
            start += 1
        }
    }
    
    return minLength == Int.max ? 0 : minLength
}
