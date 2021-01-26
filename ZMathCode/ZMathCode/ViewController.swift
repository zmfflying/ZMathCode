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
        let trie = Trie();

        trie.insert("apple");
        print(trie.search("apple")) // 返回 true
        print(trie.search("app"))     // 返回 false
        print(trie.startsWith("app")) // 返回 true
        trie.insert("app");
        print(trie.search("app"))     // 返回 true
    }
}
