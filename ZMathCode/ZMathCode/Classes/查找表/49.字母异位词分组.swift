//
//  49.字母异位词分组.swift
//  ZMathCode
//
//  Created by zmfflying on 2023/4/27.
//  Copyright © 2023 zmfflying. All rights reserved.
//
/**
## 题目
 给你一个字符串数组，请你将 字母异位词 组合在一起。可以按任意顺序返回结果列表。

 字母异位词 是由重新排列源单词的字母得到的一个新单词，所有源单词中的字母通常恰好只用一次。

  

 示例 1:

 输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
 示例 2:

 输入: strs = [""]
 输出: [[""]]
 示例 3:

 输入: strs = ["a"]
 输出: [["a"]]
  

 提示：

 1 <= strs.length <= 104
 0 <= strs[i].length <= 100
 strs[i] 仅包含小写字母

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/group-anagrams
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 print("\(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))")

## 笔记
 这道题的核心就是 排序+字典

## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dic: [String: [String]] = [String: [String]]()
    
    for str in strs {
        //排序
        let sortStr: String = String(str.sorted())
        if let arr = dic[sortStr] {
            dic[sortStr] = arr + [str]
        } else {
            dic[sortStr] = [str]
        }
    }
    return Array(dic.values)
}
