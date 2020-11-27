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
        let l11 = ListNode(2)
        let l111 = ListNode(3)
        let l1111 = ListNode(4)
        l1.next = l11
        l11.next = l111
        l111.next = l1111
        print("\(description1(l1: reverseList(l1)!))")
    }


}

