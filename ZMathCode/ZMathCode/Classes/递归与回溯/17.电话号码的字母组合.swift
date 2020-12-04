//
//  17.电话号码的字母组合.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/4.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 2 abc
 3 def
 4 ghi
 5 jkl
 6 mno
 7 pqrs
 8 tuv
 9 wxyz
 
 示例:

 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(letterCombinations("23"))

## 笔记
 这道题的确是要使用递归的思想
 首先定义好数字对应的字符串数组
 然后把传入的字符串转为数组
 每次都是拿当前字母对应的数组,暂时记录下来
 接着是继续取到上次递归返回的数组
 然后对这两个数组进行双层循环,取到本次递归获取到的最新的数组病返回
 
 注意要判断下是不是递归到最后一个字母了
 如果是最后一个字母,就返回这个字母在字典里对应的数组
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {
        return []
    }
    //首先定义好数字对应的字符串数组
    let dic = ["2":["a","b","c"], "3":["d","e","f"], "4":["g","h","i"], "5":["j","k","l"], "6":["m","n","o"], "7":["p","q","r","s"], "8":["t","u","v"], "9":["w","x","y","z"]] as [Character: [String]]
    
    //递归方法 返回
    func help(strArr: Array<Character>?) -> [String] {
        var temp = strArr
        //取出第一个字母和它对应的字符串数组
        let first = temp?.removeFirst()
        let arr = dic[first!]!
        
        if strArr?.count == 1 {
            //递归到最后一个字母的时候,就直接返回取到的数据
            return arr
        }
        let arr1 = help(strArr: temp)
        
        //记录本次拼接好的数据
        var res: [String] = [String]()
        for s in arr {
            for s1 in arr1 {
                res.append("\(s)\(s1)")
            }
        }
        return res
    }
    
    //提前把字符串转为数组 Array<Character>
    return help(strArr: Array(digits))
}
