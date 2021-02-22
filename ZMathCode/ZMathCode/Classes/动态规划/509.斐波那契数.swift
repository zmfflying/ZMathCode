//
//  509.斐波那契数.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/20.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 斐波那契数，通常用 F(n) 表示，形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：

 F(0) = 0，F(1) = 1
 F(n) = F(n - 1) + F(n - 2)，其中 n > 1
 给你 n ，请计算 F(n) 。


 示例 1：

 输入：2
 输出：1
 解释：F(2) = F(1) + F(0) = 1 + 0 = 1
 示例 2：

 输入：3
 输出：2
 解释：F(3) = F(2) + F(1) = 1 + 1 = 2
 示例 3：

 输入：4
 输出：3
 解释：F(4) = F(3) + F(2) = 2 + 1 = 3
  

 提示：

 0 <= n <= 30

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/fibonacci-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(fib(4))

## 笔记
 这道题的解法主要有四种
 
 第一种是递归,见代码 1.1
 但是单纯的递归重复计算太多,可以用一个字典记录已经计算出来的数据,见代码 1.2
 
 第二种是动态规划,从 2 一点点计算到 n,这种方法需要开辟空间来记录上一次的值
 用一个字典记录的方法见代码 2.1
 用 int 变量记录后进行数据交换的方法见代码 2.2
 
 第三种是查找表,根据题目要求是 0 <= n <= 30, 那么直接把这些数字对应的 斐波那契数 放到一个字典中,到时候直接取就好了,见代码 3.1
 
 第四种是通项公式,斐波那契数 有一个计算的通项公式,直接套公式就行,见代码 4.1
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
*/

import Foundation

// MARK: - 1.1 递归
//func fib(_ n: Int) -> Int {
//    if n < 2 {
//        return n
//    }
//    return fib(n - 1) + fib(n - 2)
//}


// MARK: - 1.2 递归 - 免重复计算
//func fib(_ n: Int) -> Int {
//    var dic: [Int: Int] = [Int: Int]()
//
//    func help(_ n: Int) -> Int {
//        if let res = dic[n] {
//            return res
//        }
//
//        if n < 2 {
//            return n
//        }
//
//        let res = help(n - 1) + help(n - 2)
//        dic[n] = res
//        return res
//    }
//    return help(n)
//}


// MARK: - 2.1 动态规划 - 字典记录之前的数据
func fib(_ n: Int) -> Int {
    if n < 2 {
        return n
    }

    //创建一个字典,且提前存入 0 和 1 的值
    var dic: [Int: Int] = [Int: Int]()
    dic[0] = 0
    dic[1] = 1

    var i = 2
    while i <= n {
        //计算出本次的和 sum, 然后存入字典中
        //因为是从 2 开始,而且 0 和 1 已经存入字典中,所以直接强制解包就行
        let sum = dic[i - 1]! + dic[i - 2]!
        dic[i] = sum
        i += 1
    }
    return dic[n]!
}


// MARK: - 2.2 动态规划 - 数据交换
//func fib(_ n: Int) -> Int {
//    if n < 2 {
//        return n
//    }
//
//    //从 2 开始
//    var pre = 0
//    var cur = 1
//
//    var i = 2
//    while i <= n {
//        //计算出本次的和 sum, 然后进行数据交换
//        let sum = pre + cur
//        pre = cur
//        cur = sum
//        i += 1
//    }
//    return cur
//}


// MARK: - 3.1 查找表
//func fib(_ n: Int) -> Int {
//    let dic: [Int: Int] = [0: 0, 1: 1, 2: 1, 3: 2, 4: 3, 5: 5, 6: 8, 7: 13, 8: 21, 9: 34, 10: 55, 11: 89, 12: 144, 13: 233, 14: 377, 15: 610, 16: 987, 17: 1597, 18: 2584, 19: 4181, 20: 6765, 21: 10946, 22: 17711, 23: 28657, 24: 46368, 25: 75025, 26: 121393, 27: 196418, 28: 317811, 29: 514229, 30: 832040]
//    return dic[n]!
//}


// MARK: - 4.1 通项公式
//func fib(_ n: Int) -> Int {
//    let sqrt5: Double = sqrt(5)
//    let fibN = pow((1 + sqrt5) / 2, Double(n)) - pow((1 - sqrt5) / 2, Double(n))
//    return Int(round(fibN / sqrt5))
//}
