//
//  131.分割回文串.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/9.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。

 返回 s 所有可能的分割方案。

 示例:

 输入: "aab"
 输出:
 [
   ["aa","b"],
   ["a","a","b"]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-partitioning
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(partition("aab"))

## 笔记
 这道题的核心是保证每次递归时前面的数据正确,只用考虑后面对的数据
 具体的逻辑见代码和注释
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func partition(_ s: String) -> [[String]] {
    //res 是最终结果数组
    var res: [[String]] = [[String]]()
    //path 是当前的字符串数组 如 ["a","a","b"] 或者 ["aa"]
    //注意 path在同一时刻是唯一的
    var path: [String] = [String]()
    
    //定义一个判断是否是回文串的方法
    func isPalindrome(strs: [Character], startIndex: Int, endIndex: Int) -> Bool {
        var i = startIndex
        var j = endIndex
        while i < j {
            if strs[i] != strs[j] {
                return false
            }
            i += 1
            j -= 1
        }
        
        return true
    }
    
    func help(strs: [Character], startIndex: Int) {
        
        if strs.count == startIndex {
            //如果能走到这里 strs已经走完 这个时候的path就是正确的数据
            //不正确的数据在前面就被略过了
            res.append(path)
            return
        }
        
        //这里循环的逻辑是前面的数据绝对正确 比如 aba 那么在第一个a的时候 aba 就已经被计算出来了 所以到b的时候 就不用再考虑前面的a了
        for length in 1...(strs.count - startIndex) {
            let curIndex = startIndex + length
            
            //这里 curIndex - 1 是因为要判断单个字母
            if isPalindrome(strs: strs, startIndex: startIndex, endIndex: curIndex - 1) {
                
                //如果本次数据是回文串 加入path 并开始查询接下来的数据
                path.append(String(strs[startIndex ..< curIndex]))
                help(strs: strs, startIndex: curIndex)
                
                //走到这里 说明本次的回文串产生的数据查询完毕
                //删除本次数据 然后继续下次循环
                path.removeLast()
            }
        }
    }
    
    help(strs: Array(s), startIndex: 0)
    return res
}
