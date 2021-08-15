//
//  MessageNode.swift
//  texturePractice
//
//  Created by 황지은 on 2021/08/11.
//

import AsyncDisplayKit

class MessageNode: ASDisplayNode {
    
    // text형 노드 생성
    lazy var textNode = { () -> ASTextNode in
        let node = ASTextNode()
        node.attributedText = NSAttributedString(
        string: "Hello Tex-Brother",
            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        )
        return node
    }()
    
    //백그라운드에서 동작
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .systemTeal
    }
    
    // init메소드가 끝나고 Node 객체가 되었을 때 호출
    override func didLoad() {
        // Main thread에서 접근 가능한 속성들은 didLoad 메소드에서 접근해야함(ex .view .layer)
        super.didLoad()
    }
    
    // Yoga Layout Flex-Box 기반
    // 백그라운드 스레드에서 레이아웃을 설계하고 빌드
    // layoutSpecThatFits 메서드를 이용하여 레이아웃의 방향, 간격, 배치, 정렬 등 레이아웃을 어떻게 구성할지 작성
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 0,
                                 justifyContent: .center,
                                 alignItems: .center,
                                 children: [textNode])
        
        //justifyContent : vertical align | | |
        //alignItems: horizontal align - - -
    }
    
    // layoutSpecThatFits 메소드에서 레이아웃 빌드 후 메인 스레드에서 레이아웃이 변경될 때마다 호출
    // 레이아웃 변화에 따른 업데이트가 필요한 추가적인 요소를 처리
    override func layout() {
        super.layout()
    }
}
