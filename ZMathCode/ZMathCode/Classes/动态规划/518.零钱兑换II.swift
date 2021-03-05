//
//  518.零钱兑换II.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/3/2.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定不同面额的硬币和一个总金额。写出函数来计算可以凑成总金额的硬币组合数。假设每一种面额的硬币有无限个。

 示例 1:

 输入: amount = 5, coins = [1, 2, 5]
 输出: 4
 解释: 有四种方式可以凑成总金额:
 5=5
 5=2+2+1
 5=2+1+1+1
 5=1+1+1+1+1
 示例 2:

 输入: amount = 3, coins = [2]
 输出: 0
 解释: 只用面额2的硬币不能凑成总金额3。
 示例 3:

 输入: amount = 10, coins = [10]
 输出: 1
  

 注意:

 你可以假设：

 0 <= amount (总金额) <= 5000
 1 <= coin (硬币面额) <= 5000
 硬币种类不超过 500 种
 结果符合 32 位符号整数


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/coin-change-2
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(change(5, [1, 2, 5]))

## 笔记
 这道题看起来和 39.组合总和 是差不多的
 但是用递归的方式是会超时的, 因为这道题不需要具体的解, 只需要知道有多少种组合就行了
 
 难点就在于推导出动态规划的公式
 假设现在只有面额 2 的硬币,即 coin = 2
 
 首先创建一个数组 dp 记录每个金额对应的组合
 总金额 amount = 0 的时候, 一定有且仅有 1 种组合, dp[0] = 1
 总金额 amount < coin 的时候, 一定有且仅有 0 种组合, dp[1] = 0
 
 总金额 amount = 2 的时候, 有 1 种组合, dp[2] = 1 = dp[2-2]
 总金额 amount = 3 的时候, 有 0 种组合, dp[3] = 0 = dp[3-2]
 总金额 amount = 4 的时候, 有 1 种组合, dp[4] = 1 = dp[4-2] = dp[2-2]
 总金额 amount = 5 的时候, 有 0 种组合, dp[5] = 0 = dp[5-2] = dp[3-2]
 
 为什么会这样呢?
 因为就同一个 coin 而言, amount >= coin的时候, amount 的组合个数, 肯定是和 amount - coin 的个数是相等的
 即 dp[amount] = dp[amount-coin]
 
 多个 coin 的时候, dp[amount] = dp[amount] + dp[amount-coin] 即可
 假设 amount = 3, coins = [1, 2], dp = [1, 0, 0, 0]
 
 当 coin = 1 的时候,
 dp[3] = dp[2] = dp[1] = dp[0] = 1
 dp = [1, 1, 1, 1]
 
 当 coin = 2 的时候,
 dp[2] = 1 + dp[0] = 2
 dp[3] = 1 + dp[1] = 2
 dp = [1, 1, 2, 2]
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

func change(_ amount: Int, _ coins: [Int]) -> Int {
    var dp: [Int] = [Int].init(repeating: 0, count: amount+1)
    dp[0] = 1
    
    for coin in coins {
        if coin > amount {
            continue
        }
        for i in coin...amount {
           dp[i] += dp[i-coin]
        }
    }
    return dp[amount]
}


//递归  超时的
func change1(_ amount: Int, _ coins: [Int]) -> Int {
    if amount == 0 {
        return 1
    }
    var res = 0
    let count = coins.count
    
    func help(cur: Int, index: Int) {
        if cur > amount || index >= count {
            return
        }
        
        for i in index..<count {
            let num = coins[i]
            let newNum = num + cur
            if newNum < amount {
                help(cur: newNum, index: i)
            } else if newNum == amount {
                res += 1
            }
        }
    }
    
    help(cur: 0, index: 0)
    return res
}
