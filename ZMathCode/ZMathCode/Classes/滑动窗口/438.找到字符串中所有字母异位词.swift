//
//  438.找到字符串中所有字母异位词.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/13.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 给定一个字符串 s 和一个非空字符串 p，找到 s 中所有是 p 的字母异位词的子串，返回这些子串的起始索引。

 字符串只包含小写英文字母，并且字符串 s 和 p 的长度都不超过 20100。

 说明：

 字母异位词指字母相同，但排列不同的字符串。
 不考虑答案输出的顺序。
 示例 1:

 输入:
 s: "cbaebabacd" p: "abc"

 输出:
 [0, 6]

 解释:
 起始索引等于 0 的子串是 "cba", 它是 "abc" 的字母异位词。
 起始索引等于 6 的子串是 "bac", 它是 "abc" 的字母异位词。
  示例 2:

 输入:
 s: "abab" p: "ab"

 输出:
 [0, 1, 2]

 解释:
 起始索引等于 0 的子串是 "ab", 它是 "ab" 的字母异位词。
 起始索引等于 1 的子串是 "ba", 它是 "ab" 的字母异位词。
 起始索引等于 2 的子串是 "ab", 它是 "ab" 的字母异位词。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-all-anagrams-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(findAnagrams("cbaebabacd", "abc"))

## 笔记
 这道题还是滑动窗口的思想
 不要需要注意的是满足条件有两个
 第一个是: 窗口里有目标字符串的字母异位词
 第二个是: 窗口的长度和目标字符串长度相等
 
 我最开始做的时候,考虑了很多情况
 比如 出现目标字符串之外的字符的时候怎么处理
 比如 循环中出现超出目标字符串个数之外的情况怎么处理
 
 但其实没有必要,只要遵循着两个满足条件,用滑动窗口的思想即可:
 不满足条件的时候右边界往后移
 满足条件的时候左边界往后移
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func findAnagrams(_ s: String, _ p: String) -> [Int] {
    if s.count < p.count {
        return []
    }
    
    var res:[Int] = [Int]()
    
    //swift里字符串不好计算 转为数组[Character]
    let arrS:[Character] = Array(s)
    let arrP:[Character] = Array(p)
    
    //找出需要的字符和对应的个数
    var dicP:[Character: Int] = [Character: Int]()
    for c in arrP {
        dicP[c] = dicP[c] == nil ? 1 : (dicP[c]! + 1)
    }
    
    //窗口相关
    var dicWindow:[Character: Int] = [Character: Int]()
    var start: Int = 0
    var end: Int = 0
    
    //重要 这个是判断窗口是否符合条件的依据之一
    var match = 0
    
    while end < arrS.count {
        let c = arrS[end]
        
        //先把拿到的字符和对应的个数都存到窗口里
        if dicWindow[c] == nil {
            dicWindow[c] = 1
        } else {
            let newCount = dicWindow[c]! + 1
            dicWindow[c] = newCount
        }
        
        //当窗口里某个字符个数等于目标字符串里的个数的时候 match个数加一
        if let pCount = dicP[c] {
            if pCount == dicWindow[c] {
                match += 1
            }
        }
        
        //满足条件一: 窗口里可能有目标字符串的字母异位词
        //比如 abdc -> abc
        while match == dicP.count {
            //满足条件二: 长度相同,即中间没有其他字符
            if end - start + 1 == arrP.count {
                res.append(start)
            }
            
            let cStart: Character = arrS[start]
            let curCount = dicWindow[cStart]!
            
            //窗口的左边界要开始往后移
            //如果本来 窗口里的个数和目标字符串里的个数相同
            //那么左边界移动后这个字符的个数就不再相同了,match 就要减一
            if curCount == dicP[cStart] {
                match -= 1
            }
            
            //这是左边界往后移的操作
            dicWindow[cStart] = curCount - 1
            start += 1
        }
        
        //这是右边界往后移的操作
        end += 1
    }
    
    return res
}
