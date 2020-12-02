//
//  ViewController.swift
//  ZMathCode
//
//  Created by zmfflying on 2020/6/23.
//  Copyright © 2020 zmfflying. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let l1 = ListNode(1)
        let l2 = ListNode(2)
        let l3 = ListNode(6)
        let l4 = ListNode(3)
        let l5 = ListNode(4)
        let l6 = ListNode(5)
        let l7 = ListNode(6)
        l1.next = l2
        l2.next = l3
        l3.next = l4
        l4.next = l5
        l5.next = l6
        l6.next = l7
        print("\(description1(l1: removeElements(l1, 6)!))")
    }


}

