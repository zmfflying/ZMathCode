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
        let tree10 = TreeNode.init(1, nil, nil)
        let tree9 = TreeNode.init(2, nil, nil)
        let tree8 = TreeNode.init(7, nil, nil)
        let tree7 = TreeNode.init(4, nil, tree10)
        let tree6 = TreeNode.init(13, nil, nil)
        let tree5 = TreeNode.init(11, tree8, tree9)
        let tree4 = TreeNode.init(8, tree6, tree7)
        let tree3 = TreeNode.init(4, tree5, nil)
        let tree2 = TreeNode.init(5, tree3, tree4)
        print(hasPathSum(tree2, 22))
    }
}
