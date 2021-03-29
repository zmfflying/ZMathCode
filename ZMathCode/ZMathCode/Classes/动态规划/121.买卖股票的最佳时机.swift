//
//  121.买卖股票的最佳时机.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/3/18.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。


 示例 1：

 输入：[7,1,5,3,6,4]
 输出：5
 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2：

 输入：prices = [7,6,4,3,1]
 输出：0
 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
  

 提示：

 1 <= prices.length <= 105
 0 <= prices[i] <= 104

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(maxProfit1([7,1,5,3,6,4]))

## 笔记
 这道题的核心是只能买一次卖一次
 那么就要在最小值的时候买,在最大差值的时候卖
 
 不断更新最小值,找到最大差值即可
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//找出最小值
func maxProfit1(_ prices: [Int]) -> Int {
    var res: Int = 0
    var minP = prices[0]
    for i in 1..<prices.count {
        let price = prices[i]
        //找出最小值
        minP = min(minP, price)
        //计算最大值
        res = max(res, price - minP)
    }
    
    return res
}

//利润差转移
func maxProfit2(_ prices: [Int]) -> Int {
    var res: Int = 0
    var pre: Int = 0
    for i in 1..<prices.count {
        //计算出当天卖出的利润差
        let diff = prices[i] - prices[i-1]
        //计算出当天卖出的收益
        pre = max(pre + diff, 0)
        //计算最大收益
        res = max(res, pre)
    }
    return res
}


//暴力解法 超出时间限制
func maxProfit3(_ prices: [Int]) -> Int {
    var res: Int = 0
    for i in 0..<prices.count {
        let buyPrice = prices[i]
        
        var j = i + 1
        while j < prices.count {
            let sellPrice = prices[j]
            res = max(res, sellPrice - buyPrice)
            j += 1
        }
    }
    return res
}

