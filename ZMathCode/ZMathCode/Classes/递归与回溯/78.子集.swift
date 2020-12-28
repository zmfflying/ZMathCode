//
//  78.子集.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/28.
//  Copyright © 2020 zmfflying. All rights reserved.
//

/**
## 题目
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:

 输入: nums = [1,2,3]
 输出:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subsets
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(subsets([1,2,3]))

## 笔记
 这道题也是 递归+循环
 需要注意的是每次数据都是对的和不重复的,直接用即可
 然后就是每次需要循环的次数是 数组的个数减去当前的索引
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    var res: [[Int]] = [[Int]]()
    //path 是当前的数组 如 [1,2]
    //注意 path在同一时刻是唯一的
    var path: [Int] = [Int]()
    let count = nums.count
    
    func help(curIndex: Int) {
        //只要求不重复  那么path都是可以用的 不需要判断
        res.append(path)
        
        //这里就是每次到一个数的时候 循环都是从0开始 循环 count - curIndex 次
        //比如 第一次循环的时候 curIndex为0 循环 3 次
        for length in 0..<(count - curIndex) {
            let index = curIndex + length
            path.append(nums[index])
            help(curIndex: index + 1)
            path.removeLast()
        }
    }
    
    help(curIndex: 0)
    return res
}

