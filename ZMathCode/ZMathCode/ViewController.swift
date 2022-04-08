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
        
        let tree5 = TreeNode.init(7, nil, nil)
        let tree4 = TreeNode.init(15, nil, nil)
        let tree3 = TreeNode.init(20, tree4, tree5)
        let tree2 = TreeNode.init(9, nil, nil)
        let tree1 = TreeNode.init(3, tree2, tree3)
        print(minDepth(tree1))
    }
}
