//
//  1027.最长等差数列.swift
//  ZMathCode
//
//  Created by QZD on 2021/5/26.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个整数数组 A，返回 A 中最长等差子序列的长度。

 回想一下，A 的子序列是列表 A[i_1], A[i_2], ..., A[i_k] 其中 0 <= i_1 < i_2 < ... < i_k <= A.length - 1。并且如果 B[i+1] - B[i]( 0 <= i < B.length - 1) 的值都相同，那么序列 B 是等差的。

  

 示例 1：

 输入：[3,6,9,12]
 输出：4
 解释：
 整个数组是公差为 3 的等差数列。
 示例 2：

 输入：[9,4,7,2,10]
 输出：3
 解释：
 最长的等差子序列是 [4,7,10]。
 示例 3：

 输入：[20,1,15,3,10,5,8]
 输出：4
 解释：
 最长的等差子序列是 [20,15,10,5]。
  

 提示：

 2 <= A.length <= 2000
 0 <= A[i] <= 10000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-arithmetic-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(longestArithSeqLength([20,1,15,3,10,5,8]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */


import Foundation

func longestArithSeqLength(_ nums: [Int]) -> Int {
    if nums.count < 2 {
        return 0
    }
    var res: Int = 0
    var dp: [[Int: Int]] = [[Int: Int]].init(repeating: [Int : Int](), count: nums.count)
    for i in 1..<nums.count {
        let num = nums[i]
        for j in 0..<i {
            let tmp = num - nums[j]
            var sep = 1;
            if let pre = dp[j][tmp] {
                sep += pre
            }
            res = max(res, sep)
            dp[i][tmp] = sep
        }
    }
    return res+1
}
