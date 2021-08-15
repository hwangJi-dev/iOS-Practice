//
//  ViewController.swift
//  texturePractice
//
//  Created by 황지은 on 2021/08/11.
//

import AsyncDisplayKit

class ViewController: ASDKViewController<MessageNode> {
    
    override init() {
        super.init(node: MessageNode.init())
        self.node.automaticallyManagesSubnodes = true
       // self.node.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
