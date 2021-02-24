//
//  343.整数拆分.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/22.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个正整数 n，将其拆分为至少两个正整数的和，并使这些整数的乘积最大化。 返回你可以获得的最大乘积。

 示例 1:

 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1。
 示例 2:

 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
 说明: 你可以假设 n 不小于 2 且不大于 58。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/integer-break
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(integerBreak(10))

## 笔记
 这道题其实就是要从小到大,一点点去计算和存储每个数对应的最大乘积
 我用的是动态规划的方法,至于把 2 到 58 每个数对应的最大乘积放到一个字典中的查找表方法就不讲了
 
 我们假设 n = 3, 用一个字典 dic: [Int: Int] 来存储每个数对应的最大乘积
 那么 3 = 1 + 2 的时候,最大乘积就是 max(1 * 2, 1 * dic[2])
 3 = 2 + 1 的时候,最大乘积就是 max(2 * 1, 2 * dic[1])
 所以最终的结果就是上面两个最大乘积的最大值
 
 注意 1 * 2 和 2 * 1 是数字 3 的时候新增的
 而 1 * dic[2] 和 2 * dic[1] 是在计算出历史最大乘积在本轮中可能出现的结果
 这也就是内层循环里计算最大乘积的逻辑
 
 然后当然需要一个外层循环来计算每个数对应的最大乘积
 这样从小到大,每一个数都能得到最大乘积了
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func integerBreak(_ n: Int) -> Int {
    //创建一个字典来存放 每个正整数 对应的 最大乘积
    var dic: [Int: Int] = [Int: Int]()
    dic[1] = 1
    //从 2 开始
    for i in 2...n {
        //创建一个变量来记录本次 i 的最大值
        var temp = 0
        for j in 1..<i {
            //首先根据 i 对应的最大乘积, 肯定在 j * (i-j) 和 j * dic[i-j] 中,原因如下
            //第一:dic[i-j] 是代表着找到 i-j 的最大乘积
            //比如 i = 10, 那么从 1 到 9 的最大乘积都已经存储在字典中了,那么此时 j * dic[i-j] 就是找到了 1 到 9 所有可能的最大乘积了
            //第二: j * (i-j) 是本轮也是 10 的时候新增的, 比如 1*9,2*8, 这个在前面1到9的时候是没计算过的
            //然后与temp进行比对,最后就可以得到本轮的最大乘积
            temp = max(temp, max(j * (i-j), j * dic[i-j]!))
        }
        //把本轮得到的最大乘积存入字典中
        dic[i] = temp
    }
    return dic[n]!
}
