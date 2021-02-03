//
//  283.移动零.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/3.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例:

 输入: [0,1,0,3,12]
 输出: [1,3,12,0,0]
 说明:

 必须在原数组上操作，不能拷贝额外的数组。
 尽量减少操作次数。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/move-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 var nums = [0,1,0,3,12]
 moveZeroes(&nums)
 print(nums)

## 笔记
 这道题就是也是双指针
 维护两段数据的正确:
    0 < left 一定是非0
    left <= right 一定是0
 
 
 具体方法就是
 循环的时候,遇见非0元素就左右都移动
 同时进行元素交换
 遇见0的时候只移动右边
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    if nums.count <= 1 {
        return
    }
    //0 < left 一定是非0
    //left <= right 一定是0
    var left = 0
    var right = 0
    while right < nums.count {
        //right 非0的时候 左右都要移动
        //还要交换 right 和 left的值
        if nums[right] != 0 {
            if left != right {
//                let temp = nums[left]
//                nums[left] = nums[right]
//                nums[right] = temp
                
                // left != right 的时候 nums[left] 一定为0
                nums[left] = nums[right]
                nums[right] = 0
            }
            
            left += 1
        }
        //right 为0的时候, 只移动右边
        right += 1
    }
}

