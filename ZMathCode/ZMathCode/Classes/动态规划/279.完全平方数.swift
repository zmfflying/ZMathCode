//
//  279.完全平方数.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/24.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。

 给你一个整数 n ，返回和为 n 的完全平方数的 最少数量 。

 完全平方数 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。

 示例 1：

 输入：n = 12
 输出：3
 解释：12 = 4 + 4 + 4
 示例 2：

 输入：n = 13
 输出：2
 解释：13 = 4 + 9
  
 提示：

 1 <= n <= 104

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/perfect-squares
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(numSquares(12))

## 笔记
 这道题其实也是动态规划的思路,从小到大
 本次的最小完全平方数个数 等于 前面那个数的最小平方个数 加 1
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

// MARK: - 2.2 动态规划
func numSquares(_ n: Int) -> Int {
    if n == 1 { return 1 }

    var arr = Array(repeating: 0, count: n + 1)
    arr[1] = 1

    for i in 2...n {
        //记录本次 i 对应的值
        //temp 初始赋值为 i, 是因为 2 = 1 + 1, 3 = 1 + 1 + 1,,,,
        var temp = i
        
        //要把小于 1 到 i 之间的完全平方数都拿出来
        var j = 1
        while j * j <= i {
            
            //注意 arr[i - j*j] 是前面那个数 i - j*j 的最小完全平方数个数
            //所以要 arr[i - j*j] + 1 就是本次循环里 i 的最小完全平方数个数
            temp = min(temp, arr[i - j*j] + 1)
            j += 1
        }
        arr[i] = temp
    }
    return arr.last!
}


// MARK: - 1.1 递归
func numSquares1(_ n: Int) -> Int {
    var arr: [Int] = [Int].init(repeating: -1, count: n+1)

    var nums: [Int] = [Int]()
    for i in 1...n {
        let num = i * i
        if num > n {
            break
        }
        nums.append(num)
        arr[num] = 1
    }

    func help(_ n: Int) -> Int {
        if arr[n] != -1  {
            return arr[n]
        }

        var minLen = n
        for num in nums {
            if n < num {
                break
            }
            minLen = min(minLen, help(n - num) + 1)
        }
        arr[n] = minLen
        return minLen
    }

    return help(n)
}
