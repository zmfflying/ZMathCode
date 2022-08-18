//
//  494.目标和.swift
//  ZMathCode
//
//  Created by QZD on 2021/9/28.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给你一个整数数组 nums 和一个整数 target 。

 向数组中的每个整数前添加 '+' 或 '-' ，然后串联起所有整数，可以构造一个 表达式 ：

 例如，nums = [2, 1] ，可以在 2 之前添加 '+' ，在 1 之前添加 '-' ，然后串联起来得到表达式 "+2-1" 。
 返回可以通过上述方法构造的、运算结果等于 target 的不同 表达式 的数目。

  

 示例 1：

 输入：nums = [1,1,1,1,1], target = 3
 输出：5
 解释：一共有 5 种方法让最终目标和为 3 。
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 示例 2：

 输入：nums = [1], target = 1
 输出：1
  

 提示：

 1 <= nums.length <= 20
 0 <= nums[i] <= 1000
 0 <= sum(nums[i]) <= 1000
 -1000 <= target <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/target-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(findTargetSumWays([1,1,1,1,1], 3))

## 笔记
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//一维数组 使用lastDp辅助
func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    if nums.count < 1 {
        return 0
    }
    var sum = 0
    for num in nums {
        sum += num
    }
    let t = abs(target)
    if t > sum || (sum + t) % 2 == 1 {
        return 0
    }
    /**
     正数和 x
     负数和 y
     x - y = target
     x + y = sum
     
     y = x - target = sum - x
     2x = sum + target
     x = (sum + target) / 2
     */
    let newTargrt = (sum + t) / 2
    var dp: [Int] = [Int].init(repeating: 0, count: newTargrt+1)
    dp[0] = 1
    var lastDp: [Int] = dp
    
    for i in 1...nums.count {
        let num = nums[i-1]
        dp = lastDp
        for j in num...newTargrt {
            dp[j] += lastDp[j-num]
        }
        lastDp = dp
    }
    
    return dp.last!
}

//一维数组 倒序
//func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
//    if nums.count < 1 {
//        return 0
//    }
//    var sum = 0
//    for num in nums {
//        sum += num
//    }
//    let t = abs(target)
//    if t > sum || (sum + t) % 2 == 1 {
//        return 0
//    }
//    let newTargrt = (sum + t) / 2
//    var dp: [Int] = [Int].init(repeating: 0, count: newTargrt+1)
//    dp[0] = 1
//
//    for i in 1...nums.count {
//        let num = nums[i-1]
//        for j in (num...newTargrt).reversed() {
//            if num <= j {
//                dp[j] += dp[j-num]
//            }
//        }
//    }
//
//    return dp.last!
//}

//二维数组
//func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
//    var sum = 0
//    for num in nums {
//        sum += num
//    }
//    if abs(target) > sum || (sum + target) % 2 == 1 {
//        return 0
//    }
//    let newTargrt = (sum + abs(target)) / 2
//    var dp: [[Int]] = [[Int]].init(repeating: [Int].init(repeating: 0, count: newTargrt+1), count: nums.count + 1)
//    dp[0][0] = 1
//
//    for i in 1...nums.count {
//        let num = nums[i-1]
//        for j in 0...newTargrt {
//            dp[i][j] = dp[i-1][j]
//            if num <= j {
//                dp[i][j] += dp[i-1][j-num]
//            }
//        }
//    }
//
//    return dp.last!.last!
//}


//func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
//    let len = nums.count
//    var dp: [[Int: Int]] = [[Int: Int]].init(repeating: [:], count: len)
//    if nums[0] != 0 {
//        dp[0] = [nums[0]: 1, -nums[0]: 1]
//    } else {
//        dp[0] = [0: 2]
//    }
//
//    for i in 1..<len {
//        let curNum = nums[i]
//        for (num, count) in dp[i-1] {
//            dp[i][curNum + num] = (dp[i][curNum + num] ?? 0) + count
//            dp[i][-curNum + num] = (dp[i][-curNum + num] ?? 0) + count
//        }
//    }
//    return dp[len-1][target] ?? 0
//}

//暴力解法
//func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
//    var result: Int = 0
//    var dp: [Int] = [0]
//
//    let len = nums.count
//    for i in 0..<len {
//        let curNum = nums[i]
//        var tmpArr: [Int] = []
//        for num in dp {
//            let add = num + curNum
//            let red = num - curNum
//            tmpArr.append(add)
//            tmpArr.append(red)
//            if i == len - 1 {
//                if add == target {
//                    result += 1
//                }
//
//                if red == target {
//                    result += 1
//                }
//            }
//        }
//        dp = tmpArr
//    }
//    return result
//}

