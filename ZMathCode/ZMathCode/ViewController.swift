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
        let l1 = ListNode(3)
        let l2 = ListNode(2)
        let l3 = ListNode(0)
        let l4 = ListNode(-4)
        l1.next = l2
        l2.next = l3
        l3.next = l4
        l4.next = l2
        print("\(String(describing: detectCycle(l1)))")
    }
}
