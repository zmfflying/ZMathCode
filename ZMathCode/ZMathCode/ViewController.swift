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
        let tree9 = TreeNode.init(1, nil, nil)
        let tree8 = TreeNode.init(-2, nil, nil)
        let tree7 = TreeNode.init(3, nil, nil)
        let tree6 = TreeNode.init(11, nil, nil)
        let tree5 = TreeNode.init(2, nil, tree9)
        let tree4 = TreeNode.init(3, tree7, tree8)
        let tree3 = TreeNode.init(-3, nil, tree6)
        let tree2 = TreeNode.init(5, tree4, tree5)
        let tree1 = TreeNode.init(10, tree2, tree3)
        print(pathSum(tree1, 8))
    }
}
