//
//  22.括号生成.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/3/22.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

 示例 1：

 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 示例 2：

 输入：n = 1
 输出：["()"]
  

 提示：

 1 <= n <= 8

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/generate-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(generateParenthesis(3))

## 笔记
 这道题我的初始思路是
 dp[n] 和 dp[n-1] 的区别是增加了一个 ()
 而最左边肯定就是 (
 那么是不是每次把新增的这个 ( 固定的放在最左边
 只要处理新增的这个 ) 的位置就好了呢
 
 比如 dp[1] = [["(",")"]]
 dp[2] 的时候
 ) 在第0个位置 [")","(",")"], 再加上新增的 ( 就是: ["(",")","(",")"]
 ) 在第1个位置 ["(",")",")"], 再加上新增的 ( 就是: ["(","(",")",")"]
 
 所以 dp[2] = [["(",")","(",")"], ["(","(",")",")"]
 根据这个规律就可以得出 dp[n] 的值
 最后再把 dp[n] 转为 [String] 就是最终结果了
 
 但是中间会出现一些重复的数据,需要做去重的操作
 比如: 计算 dp[3] 对 ["(","(",")",")"] 进行处理的时候
 ) 在第2个位置 和 第3个位置都是 ["(","(","(",")",")",")"]
 
 
 
 优化思路:
 dp[0] = [""]
 dp[1] = ["()"]
 dp[2] = ["()()", "(())"]
 
 还是把新增的 ( 放在最左边
 对 dp[2] 来讲
 ) 在第 0 个位置就是 ( + dp[0] + ) + dp[1], 即 "()()"
 ) 在第 1 个位置就是 ( + dp[1] + ) + dp[0], 即 "(())"
 
 得出的公式就是
 dp[n] = ( + dp[i]的每一个元素 + ) + dp[n-1-i]的每一个元素
 
 即
 for s1 in dp[j] {
     for s2 in dp[i-j-1] {
         let tempStr = "(" + s1 + ")" + s2
     }
 }
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 
 */

import Foundation

//初始思路
func generateParenthesis(_ n: Int) -> [String] {
    if n == 1 {
        return ["()"]
    }
    
    //把新增的括号拆分成字符来处理 "()" -> ["(",")"]
    var dp = [Set<[Character]>].init(repeating: [], count: n+1)
    dp[1] = [["(",")"]]
    for i in 2...n {
        var tempArr:Set<[Character]> = []
        for arr in dp[i-1] {
            for j in 0..<arr.count {
                var temp = arr
                //字符 ) 插入到每一个位置
                temp.insert(")", at:j)
                //然后前面补上 (
                temp.insert("(", at: 0)
                tempArr.insert(temp)
            }
        }
        dp[i] = tempArr
    }
    //dp 里是字符的集合 需要转为题目要求的字符串数组
    var res:[String] = [String]()
    for set in dp.last! {
        let str = String.init(set[0..<set.count])
        res.append(str)
    }
    return res
}


//优化
func generateParenthesis1(_ n: Int) -> [String] {
    if n == 1 {
        return ["()"]
    }
    
    var dp = [[String]].init(repeating: [""], count: n+1)
    dp[1] = ["()"]
    for i in 2...n {
        var tempArr:[String] = []
        
        //重要 dp[n] = ( + dp[i]的每一个元素 + ) + dp[n-1-i]的每一个元素
        for j in 0..<i {
            for s1 in dp[j] {
                for s2 in dp[i-j-1] {
                    let tempStr = "(" + s1 + ")" + s2
                    tempArr.append(tempStr)
                }
            }
        }
        dp[i] = tempArr
    }
    return dp[n]
}
