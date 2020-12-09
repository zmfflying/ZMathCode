//
//  93.复原IP地址.swift
//  ZMathCode
//
//  Created by 张明飞 on 2020/12/4.
//  Copyright © 2020 zmfflying. All rights reserved.
//
/**
## 题目
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
 
 有效的 IP 地址 正好由四个整数（每个整数位于 0 到 255 之间组成，且不能含有前导 0），整数之间用 '.' 分隔。
 例如："0.1.2.201" 和 "192.168.1.1" 是 有效的 IP 地址，但是 "0.011.255.245"、"192.168.1.312" 和 "192.168@1.1" 是 无效的 IP 地址。

 示例 1：
 输入：s = "25525511135"
 输出：["255.255.11.135","255.255.111.35"]
 示例 2：

 输入：s = "0000"
 输出：["0.0.0.0"]
 示例 3：

 输入：s = "1111"
 输出：["1.1.1.1"]
 示例 4：

 输入：s = "010010"
 输出：["0.10.0.10","0.100.1.0"]
 示例 5：

 输入：s = "101023"
 输出：["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]

 提示：
 0 <= s.length <= 3000
 s 仅由数字组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/restore-ip-addresses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(restoreIpAddresses("25525511135"))

## 笔记
 具体的逻辑见代码和注释,这里写一下核心笔记
 这道题和普通递归的差别在于比较复杂的边界判断 和 递归里有循环
 但其实核心还是一样的,都是要每次获取到合适的 数据
 
 这次递归是从前到后,每次取到 0~255 之间的字符串
 所以每次递归里有循环 和 边界判断
 
 最终判断条件是 已经取到了4个有效数据后,如果字符串已经走完就是有效数据,如果字符串还没走完就是无效数据
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func restoreIpAddresses(_ s: String) -> [String] {
    let total = 4
    //res 是最终结果数组 存完整的ip 如 ["255.255.11.135","255.255.111.35"]
    var res: [String] = [String]()
    //cur 是当前的字符串数组 如 ["255","255","111","35"]
    //注意 cur在同一时刻是唯一的
    var cur: [String] = [String]()
    
    //strArr 不做改变 startIndex 是本次递归的开始节点
    func help(strArr: [Character], startIndex: Int) {
        //如果 cur 已经是有4个,但是字符串还没走完,说明本次数据 cur 错误,直接返回
        if strArr.count > startIndex && cur.count == total {
            return
        }
        //如果 cur 已经是有4个,字符串也已经走完,说明本次数据 cur 正确,加入 res 中
        if strArr.count == startIndex && cur.count == total {
            let ss = cur.joined(separator: ".")
            res.append(ss)
            return
        }

        //因为是 0 ~ 255 所以最多也就3位
        for length in 1...3 {
            //计算出当前节点
            let curIndex = startIndex + length
            //这里有两种数据无效情况
            //1.当前节点已经超出字符串数组大小
            //2.本次字符串是 01 这样的数据
            if curIndex - 1 >= strArr.count || (length != 1 && strArr[startIndex] == "0") {
                return
            }
            //取出本次的字符串 如 25
            let newStr = String(strArr[startIndex ..< curIndex])
            //这里是边界判断 大于255的数据不要
            if length == 3 && Int(newStr)! > 255 {
                return
            }
            //cur 里增加本次有效的字符串并开始下次遍历
            cur.append(newStr)
            help(strArr: strArr, startIndex: curIndex)
            //到这里 cur 的数据已经被改变,最后的元素是上次增加的数据,
            //需要丢弃才能保证下次循环的数据正确
            cur.removeLast()
        }
    }

    help(strArr: Array(s), startIndex: 0)
    return res
}

