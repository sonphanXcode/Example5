//
//  ListTeamateRouter.swift
//  iOS
//
//  Created by sp7 on 10/6/26.
//

import NavigationRouter
import SwiftUI

enum ListTeamateRouter {
    case detailTeamate(id: Int)
}

extension ListTeamateRouter: Routable {
    
    var destionation: AnyView {
        switch self {
        case .detailTeamate(let id):
            AnyView(DetailTeamateView(number: id))
        }
    }
}

enum ListTeamateAlert {
    case listTeamate
}

extension ListTeamateAlert: FullCoverable {
    var destination: AnyView {
        switch self {
        case .listTeamate:
            AnyView(ListTeamateView())
        }
    }
}
