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
        let tree5 = TreeNode.init(1, nil, nil)
        let tree4 = TreeNode.init(5, nil, nil)
        let tree3 = TreeNode.init(0, nil, nil)
        let tree2 = TreeNode.init(9, tree4, tree5)
        let tree1 = TreeNode.init(4, tree2, tree3)
        print(sumNumbers(tree1))
    }
}
