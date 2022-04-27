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
        var arr: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
        solve(&arr)
        print(arr)
    }
}
