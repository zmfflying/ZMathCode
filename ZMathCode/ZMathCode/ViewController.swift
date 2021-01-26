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
        let lRUCache = LRUCache(2);
        lRUCache.put(1, 1); // 缓存是 {1=1}
        lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
        print(lRUCache.get(1));    // 返回 1
        lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
        print(lRUCache.get(2));    // 返回 -1 (未找到)
        lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
        print(lRUCache.get(1));    // 返回 -1 (未找到)
        print(lRUCache.get(3));    // 返回 3
        print(lRUCache.get(4));    // 返回 4
    }
}
