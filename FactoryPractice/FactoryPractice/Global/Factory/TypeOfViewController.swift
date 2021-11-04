//
//  TypeOfViewController.swift
//  FactoryPractice
//
//  Created by 황지은 on 2021/11/04.
//

import Foundation

enum TypeOfViewController {
    case tabBar
    case home
    case add
    case setting
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StroyboardRepresentation {
        switch self {
        case .tabBar:
            return StroyboardRepresentation(bundle: nil, storyboardName: Identifiers.mainSB, storyboardId: Identifiers.mainVC)
        case .home:
            return StroyboardRepresentation(bundle: nil, storyboardName: Identifiers.homeSB, storyboardId: Identifiers.homeVC)
        case .add:
            return StroyboardRepresentation(bundle: nil, storyboardName: Identifiers.addSb, storyboardId: Identifiers.addVC)
        case .setting:
            return StroyboardRepresentation(bundle: nil, storyboardName: Identifiers.settingSB, storyboardId: Identifiers.settingVC)
        }
    }
}
