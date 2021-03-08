//
//  746.使用最小花费爬楼梯.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/3/5.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 数组的每个下标作为一个阶梯，第 i 个阶梯对应着一个非负数的体力花费值 cost[i]（下标从 0 开始）。

 每当你爬上一个阶梯你都要花费对应的体力值，一旦支付了相应的体力值，你就可以选择向上爬一个阶梯或者爬两个阶梯。

 请你找出达到楼层顶部的最低花费。在开始时，你可以选择从下标为 0 或 1 的元素作为初始阶梯。

 示例 1：

 输入：cost = [10, 15, 20]
 输出：15
 解释：最低花费是从 cost[1] 开始，然后走两步即可到阶梯顶，一共花费 15 。
  示例 2：

 输入：cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
 输出：6
 解释：最低花费方式是从 cost[0] 开始，逐个经过那些 1 ，跳过 cost[3] ，一共花费 6 。
  

 提示：

 cost 的长度范围是 [2, 1000]。
 cost[i] 将会是一个整型数据，范围为 [0, 999] 。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/min-cost-climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(minCostClimbingStairs([10, 15, 20]))

## 笔记
 数组里每个元素都有两个选择: 选择当前元素 和 不选择当前元素
 
 如果选择当前元素 i, 那么花费就有两种可能:
 第一种是选择了 i-1 和 i
 第二种是选择了 i-2 和 i
 
 如果不选择当前元素 i, 那么花费肯定就是选择了 i-1 的结果
 
 根据这个思路,创建两个数组,分别记录每个元素选择当前和不选择当前的最小花费
 最后在取出两个数组最后一个元素求最小值即可
 
 优化:
 不选择当前元素的花费 noCur[i] = cur[i-1]
 所以其实一个数组就行了
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    //选择自己的情况
    var cur: [Int] = [Int].init(repeating: 0, count: cost.count)
    cur[0] = cost[0]
    cur[1] = min(cost[0] + cost[1], cost[1])

    //不选择自己的情况
    var noCur: [Int] = [Int].init(repeating: 0, count: cost.count)
    noCur[1] = cost[0]

    for i in 2..<cost.count {
        //选择i的花费可能有两种:
        //第一种是选择了 i-1 和 i
        //第二种是选择了 i-2 和 i
        cur[i] = min(cur[i-1] + cost[i], cur[i-2] + cost[i])

        //不选择i的花费只可能有一种: 选择了 i-1
        noCur[i] = cur[i-1]
    }

    return min(cur.last!, noCur.last!)
}


// MARK: - 优化
func minCostClimbingStairs1(_ cost: [Int]) -> Int {
    var cur: [Int] = [Int].init(repeating: 0, count: cost.count)
    cur[0] = cost[0]
    cur[1] = min(cost[0] + cost[1], cost[1])
    
    for i in 2..<cost.count {
        cur[i] = min(cur[i-1] + cost[i], cur[i-2] + cost[i])
    }
    
    return min(cur.last!, cur[cost.count - 2])
}
