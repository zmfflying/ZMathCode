//
//  20.有效的括号.swift
//  ZMathCode
//
//  Created by 张明飞 on 2021/1/20.
//  Copyright © 2021 zmfflying. All rights reserved.
//
/**
 ## 题目
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。

 示例 1:

 输入: "()"
 输出: true
 示例 2:

 输入: "()[]{}"
 输出: true
 示例 3:

 输入: "(]"
 输出: false
 示例 4:

 输入: "([)]"
 输出: false
 示例 5:

 输入: "{[]}"
 输出: true

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

## 测试代码
 
 print(isValid("([)]"))

## 笔记
 这道题就是很经典的用栈的题
 遇见左边入栈
 遇见右边就取出栈顶元素进行比对
 
 
## 代码地址
 https://github.com/zmfflying/ZMathCode
 */

import Foundation

func isValid(_ s: String) -> Bool {
    //栈
    var stack: [Character] = [Character]()
    //用一个字典记录正确的对应关系 和 判断左右边
    let dic:[Character: Character] = [")": "(", "]": "[", "}": "{"]

    for c in Array(s) {
        //左边 直接入栈
        if dic[c] == nil {
            stack.append(c)
        } else {
            //右边就 取出栈顶的元素来进行比较
            //注意这里要考虑下 stack.count == 0 的情况
            if stack.count == 0 || dic[c] != stack.removeLast() {
                return false
            }
        }
    }
    //如果最后栈里没有元素了 那就是满足条件的
    return stack.count == 0 ? true : false
}

//这样更快 但其实核心思想是一样的
//func isValid(_ s: String) -> Bool {
//    var stack: [Character] = [Character]()
//
//    func isLeft(c: Character) -> Bool {
//        if c == "(" || c == "[" || c == "{" {
//            return true
//        }
//        return false
//    }
//
//    func isEqual(left: Character, right: Character) -> Bool {
//        if (left == "(" && right == ")") || (left == "[" && right == "]") || (left == "{" && right == "}") {
//            return true
//        }
//        return false
//    }
//
//    for c in Array(s) {
//        if isLeft(c: c) {
//            stack.append(c)
//        } else {
//            if stack.count == 0 || !isEqual(left: stack.removeLast(), right: c) {
//                return false
//            }
//        }
//    }
//
//    return stack.count == 0 ? true : false
//}

