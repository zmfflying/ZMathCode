//
//  435.无重叠区间.swift
//  ZMathCode
//
//  Created by QZD on 2021/9/29.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个区间的集合，找到需要移除区间的最小数量，使剩余区间互不重叠。

 注意:

 可以认为区间的终点总是大于它的起点。
 区间 [1,2] 和 [2,3] 的边界相互“接触”，但没有相互重叠。
 示例 1:

 输入: [ [1,2], [2,3], [3,4], [1,3] ]

 输出: 1

 解释: 移除 [1,3] 后，剩下的区间没有重叠。
 示例 2:

 输入: [ [1,2], [1,2], [1,2] ]

 输出: 2

 解释: 你需要移除两个 [1,2] 来使剩下的区间没有重叠。
 示例 3:

 输入: [ [1,2], [2,3] ]

 输出: 0

 解释: 你不需要移除任何区间，因为它们已经是无重叠的了。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/non-overlapping-intervals
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(eraseOverlapIntervals([[1,2], [2,3], [3,4], [1,3]]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
//    //右边界排序
//    let sortArr = intervals.sorted { arr0, arr1 in
//        return arr0[1] < arr1[1]
//    }
//
//    var end = sortArr[0][1]
//    var count = 1
//    for arr in intervals {
//        if arr[0] >= end {
//            end = arr[1]
//            count += 1
//        }
//    }
//
//    return intervals.count - count
//}

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    //左边界排序
    let sortArr = intervals.sorted { arr0, arr1 in
        return arr0[0] < arr1[0]
    }

    var end = sortArr[0][1]
    var count = 0
    for i in 1..<intervals.count {
        let arrI = sortArr[i]
        //如果排序后同一个左边界出现了多个数组
        //那么一定只会留下最小右边界的那一个
        if arrI[0] < end {
            end = min(end, arrI[1])
            count += 1
        } else {
            end = arrI[1]
        }
    }

    return count
}

//超出时间限制
//func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
//    let sortArr = intervals.sorted { arr0, arr1 in
//        return arr0[0] < arr1[0]
//    }
//
//    var dp: [Int] = [Int].init(repeating: 1, count: intervals.count)
//    var maxCount = 1
//    for i in 1..<intervals.count {
//        let arrI = sortArr[i]
//        for j in 0..<i {
//            let arrJ = sortArr[j]
//            if arrI[0] >= arrJ[1] {
//                dp[i] = max(dp[i], dp[j] + 1)
//                maxCount = max(maxCount, dp[i])
//            }
//        }
//    }
//
//    return intervals.count - maxCount
//}
