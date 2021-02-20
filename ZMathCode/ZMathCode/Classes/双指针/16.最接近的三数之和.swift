//
//  16.最接近的三数之和.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/20.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。

 示例：

 输入：nums = [-1,2,1,-4], target = 1
 输出：2
 解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
  

 提示：

 3 <= nums.length <= 10^3
 -10^3 <= nums[i] <= 10^3
 -10^4 <= target <= 10^4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/3sum-closest
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(threeSumClosest([-1,2,1,-4], 1))

## 笔记
 暴力解法就是三重循环就不说了
 
 另外一种思路是 排序 + 双指针
 先将数组排序
 然后选定一个基准 i = 0, 在外层循环里 i += 1
 左边界 left = i + 1
 右边界 right = count - 1
 
 在内层循环: left < right 的时候
 计算出三个索引对应元素的和
 如果和大于目标值,那就是右边界往前移
 如果和小于目标值,那就是左边界往后移
 每次判断 目标值 - 当前和 的绝对值大小即可
 
 另外有三个提高效率的小技巧
 1 数组个数等于3的判断
 2 重复元素跳过计算
 3 循环中当前和等于目标值直接返回
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let count = nums.count
    
    //i是基准
    var i = 0
    //双指针 left是左边界 right是右边界
    var left = 1
    var right = count - 1
    
    //小技巧1 数组个数刚好等于3的时候直接返回
    if count == 3 {
        return nums[i] + nums[left] + nums[right]
    }
    
    //数组需要进行排序 这里我用的是升序
    let sortedNums = nums.sorted()
    var res = sortedNums[i] + sortedNums[left] + sortedNums[right]
    
    while i < count - 2 {
        //小技巧2 当数组中存在重复元素的时候 避免重复运算
        if i > 0 && sortedNums[i] == sortedNums[i-1] {
            i += 1
            continue
        }
        
        left = i + 1
        right = count - 1
        
        while left < right {
            let cur = sortedNums[i] + sortedNums[left] + sortedNums[right]
            //当前值小于目标值的时候,左边界往后移
            if cur < target {
                left += 1
                
            } else if cur > target {
            //当前值大于目标值的时候,右边界往前移
                right -= 1
                
            } else {
            //小技巧3 相等的时候直接return
                return cur
            }
            
            //注意大小要判断绝对值
            if abs(target - cur) < abs(target - res) {
                res = cur
            }
        }
        //基准恒定往后移
        i += 1
    }
    
    return res
}
