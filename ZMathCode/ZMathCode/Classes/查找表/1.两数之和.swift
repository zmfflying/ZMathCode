//
//  1.两数之和.swift
//  ZMathCode
//
//  Created by zmfflying on 2020/6/23.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

  

 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print("\(twoSum([2, 7, 11, 15], 9))")

## 笔记
 核心就是字典记录之前的数字和下标，之后遍历查询字典里有没有对应的想要的那个数字就行

## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dic = Dictionary<Int, Int>()
    for (index, num) in nums.enumerated() {
        let res = target - num
        if (dic[res] != nil) {
            if let num2 = dic[res] {
                return [num2,index]
            }
        }
        dic[num] = index
    }
    return []
}
