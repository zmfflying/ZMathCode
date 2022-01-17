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
        let tree9 = TreeNode.init(4, nil, nil)
        let tree8 = TreeNode.init(7, nil, nil)
        let tree7 = TreeNode.init(8, nil, nil)
        let tree6 = TreeNode.init(0, nil, nil)
        let tree5 = TreeNode.init(2, tree8, tree9)
        let tree4 = TreeNode.init(6, nil, nil)
        let tree3 = TreeNode.init(1, tree6, tree7)
        let tree2 = TreeNode.init(5, tree4, tree5)
        let tree1 = TreeNode.init(3, tree2, tree3)
        print(lowestCommonAncestor(tree1, tree2, tree9)?.val)
    }
}
