//
//  76.最小覆盖子串.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/12.
//  Copyright © 2021 zmfflying. All rights reserved.
//

/**
 ## 题目
 给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。

 注意：如果 s 中存在这样的子串，我们保证它是唯一的答案。

 示例 1：

 输入：s = "ADOBECODEBANC", t = "ABC"
 输出："BANC"
 示例 2：

 输入：s = "a", t = "a"
 输出："a"
  

 提示：

 1 <= s.length, t.length <= 105
 s 和 t 由英文字母组成
  

 进阶：你能设计一个在 o(n) 时间内解决此问题的算法吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/minimum-window-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(minWindow("ADOBECODEBANC", "ABC"))

## 笔记
 这道题的核心还是滑动窗口思想
 外层循环右边界往后移
 满足情况后内层循环左边界往后移到不满足情况
 
 需要注意的是边界判断
 我用的是目标字符串里不同字符的数量和对应的个数来判断的
 也就是转为字典,字符为key,个数为value
 然后记录count等于字典的个数
 在外层循环里,每次寻找到合适的字符,那么字典里这个字符对应的个数减一
 如果减一后为0,那说明这个字符的个数已经满足了,count -= 1
 
 当count为0的时候,说明所有需要的字符和它对应的个数都满足了
 再开启内层循环,寻找最小窗口
 注意在内存循环里要维持 字典 和 count 的数据准确
 具体步骤见代码
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func minWindow(_ s: String, _ t: String) -> String {
    //swift里字符串不好计算 转为数组[Character]
    let arrS:[Character] = Array(s)
    
    //找出需要的字符和对应的个数
    var dicT:[Character: Int] = [Character: Int]()
    for c in Array(t) {
        dicT[c] = dicT[c] == nil ? 1 : (dicT[c]! + 1)
    }
    
    //记录窗口的历史最小数据 长度 左 右
    var minLen: Int = arrS.count + 1
    var resStart:Int = -1
    var resEnd:Int = -1
    
    //记录每次循环时窗口的左 右
    var start:Int = 0
    var end:Int = 0
    
    //重要 这个用来判断当前窗口是否满足的重要根据
    //循环中每次找到字符的个数满足的时候 count -= 1
    //当count为0的时候 说明当前窗口满足
    var count:Int = dicT.count
    
    //还是滑动窗口的思想  右边界往后移,作为循环的判断标准
    while end < arrS.count {
        let c = arrS[end]
        
        if dicT[c] != nil {
            if let curCount = dicT[c] {
                //取出当前字符对应的个数并减一
                dicT[c] = curCount - 1
                //如果减一后为0 说明当前字符的个数已经足够 count -= 1
                if curCount - 1 == 0 {
                    count -= 1
                }
            }
            
            //当 count 为0,说明此时窗口已经满足
            //因为要寻求最小值 所以要对窗口进行处理 左边界往后移
            while count == 0 {
                //找出最小值 注意长度等于end - start + 1
                if end - start + 1 < minLen {
                    resStart = start
                    resEnd = end
                    minLen = end - start + 1
                }
                
                //找出左边界
                let cLeft:Character = arrS[start]
                if let num = dicT[cLeft] {
                    //如果左边界是需要的字符 因为左边界要往后移了 所以字典dicT里的对应的数量要加1
                    dicT[cLeft] = num + 1
                    //如果字典dicT里的对应的数量为0 说明这个字符的数量是刚刚好的
                    //这里左边界往后移了 那么数量就不满足了
                    //也就是 这个窗口不再满足
                    //所以 count += 1 跳出循环 开始寻找下个满足的窗口
                    if num == 0 {
                        count += 1
                    }
                }
                //在窗口满足的情况下左边界后移
                start += 1
            }
        }
        //右边界往后移
        end += 1
    }

    return minLen > arrS.count ? "" : String(arrS[resStart...resEnd])
}

