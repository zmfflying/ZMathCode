//
//  46.全排列.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/15.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/permutations
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(permute([1,2,3]))

## 笔记
 这道题的核心就是把数组看做排列成一行的空格
 然后从左往右每一个位置都依此尝试填入一个数
 注意的是 每次前面位置的数据已经绝对正确,我们只用考虑后面位置的就行
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    //res 是最终结果数组
    var res:[[Int]] = [[Int]]()
    //path 是当前的数组 如 [1,2,3] 或者 [1,3,2]
    //注意 path在同一时刻是唯一的
    var path = nums
    
    let total = nums.count

    //total 是数组的count 用来做边界判断
    //curIndex 表示当前处理的位置 比如[1,2,3]的第0位 是1
    func help(total: Int, curIndex: Int, nums: [Int]) {
        if curIndex == total {
            //如果走到这里 nums已经走完 这个时候的path就是一次的数据
            res.append(path)
            return
        }
        
        for i in curIndex..<total {
            //这里就是从左往右每一个位置都依此尝试填入一个数
            path.swapAt(curIndex, i)
            help(total: total, curIndex: curIndex+1, nums: nums)
            //本次处理完后要把位置换回去
            path.swapAt(curIndex, i)
        }
    }
    
    help(total: total, curIndex: 0, nums: nums)
    return res
}
