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
        let tree5 = TreeNode.init(5, nil, nil)
        let tree4 = TreeNode.init(4, nil, nil)
        let tree3 = TreeNode.init(3, nil, nil)
        let tree2 = TreeNode.init(2, tree3, tree4)
        let tree1 = TreeNode.init(1, tree2, tree5)
        print(rightSideView(tree1))
    }
}
