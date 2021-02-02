//
//  面试题17.15. 最长单词.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/2/2.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一组单词words，编写一个程序，找出其中的最长单词，且该单词由这组单词中的其他单词组合而成。若有多个长度相同的结果，返回其中字典序最小的一项，若没有符合要求的单词则返回空字符串。

 示例：

 输入： ["cat","banana","dog","nana","walk","walker","dogwalker"]
 输出： "dogwalker"
 解释： "dogwalker"可由"dog"和"walker"组成。
 提示：

 0 <= len(words) <= 200
 1 <= len(words[i]) <= 100


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-word-lcci
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(longestWord(["cat","banana","dog","nana","walk","walker","dogwalker"]))

## 笔记
 思路就两步
 第一步 对数组就行排序,把长度大的字典顺序小的数据放前面
 第二步 对数组从前往后进行查找,找到合适的字符串就返回
 
 注意的是使用递归的思想判断数据是否正确
 第一 对字符串进行截取
 第二 截取出来的字符串在数组中
 第三 截取剩余的字符串也在数组中
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func longestWord(_ words: [String]) -> String {
    //第一步 对数组进行排序
    let sortedArr: [String] = words.sorted { (a, b) -> Bool in
        if a.count == b.count {
            return a < b
        } else {
            return a.count > b.count
        }
    }
    
    //用Set去掉重复数据,提高效率
    var set: Set<String> = Set<String>(sortedArr)
    
    //第二步 找到合适的数据
    for word in sortedArr {
        set.remove(word)
        if isComposeWord(set: set, word: word) {
            //因为数组已经排序 所以找到后直接返回即可
            return word
        }
    }
    
    return ""
}

//判断字符串是否符合
func isComposeWord(set: Set<String>, word: String) -> Bool {
    if word.count == 0 {
        return true
    }
    
    let str:NSString = NSString.init(string: word)
    for index in 0..<str.length {
        let temp = str.substring(to: index + 1)
        let temp1 = str.substring(from: index + 1)
        //满足条件
        //1 截取出来的字符串在数组中
        //2 截取剩余的字符串也在数组中
        if set.contains(temp) && isComposeWord(set: set, word: temp1) {
            return true
        }
    }
    //如果是符合的字符串,前面循环里就已经返回true了
    return false
}
