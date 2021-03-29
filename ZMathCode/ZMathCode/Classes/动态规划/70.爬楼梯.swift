//
//  70.爬楼梯.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/3/22.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(climbStairs(3))

## 笔记
 dp[1] = 1
 dp[2] = 2
 
 那么走到dp[3] 的最后一个台阶时,
 走了一步的方法有 dp[3-1] = dp[2] = 2 种
 走了一步的方法有 dp[3-2] = dp[1] = 1 种
 
 同理
 dp[4] = dp[4-1] + dp[4-2] = dp[3] + dp[2]
 
 所以
 dp[i] = dp[i-1] + dp[i-2]
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func climbStairs(_ n: Int) -> Int {
    if n < 3 {
        return n
    }
    var dp = [Int].init(repeating: 0, count: n+1)
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        //核心公式
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}

