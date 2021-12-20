//
//  718.最长重复子数组.swift
//  ZMathCode
//
//  Created by QZD on 2021/11/20.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给两个整数数组 A 和 B ，返回两个数组中公共的、长度最长的子数组的长度。

 示例：

 输入：
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 输出：3
 解释：
 长度最长的公共子数组是 [3, 2, 1] 。
  

 提示：

 1 <= len(A), len(B) <= 1000
 0 <= A[i], B[i] < 100


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-length-of-repeated-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(findLength([1,2,3,2,1],[3,2,1,4,7]))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
//    if nums1.count == 0 || nums2.count == 0 {
//            return 0
//        }
//        var result = 0
//
//        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums2.count + 1), count: nums1.count + 1)
//        for i in 1...nums1.count {
//            for j in 1...nums2.count {
//                if nums2[j - 1] == nums1[i - 1] {
//                    dp[i][j] = dp[i - 1][j - 1] + 1;
//                }
//                if dp[i][j] > result {
//                    result = dp[i][j]
//                }
//            }
//        }
//        return result
//}

func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let n: Int = nums1.count
    let m: Int = nums2.count
    
    var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: m+1), count: n+1)
    var result: Int = 0
    
    for i in (0..<n).reversed() {
        for j in (0..<m).reversed() {
            dp[i][j] = nums1[i] == nums2[j] ? (dp[i+1][j+1] + 1) : 0
            result = max(result, dp[i][j])
        }
    }
    return result
}
