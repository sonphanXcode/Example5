//
//  ListTeamateView.swift
//  iOS
//
//  Created by sp7 on 10/6/26.
//

import Foundation
import SwiftUI
import NavigationRouter

struct ListTeamateView: View {
    @Environment(\.sheetCoordinator) var sheetCoordinator
    
    @StateObject private var listTeamateNavigationRouter: NavigationRouter = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $listTeamateNavigationRouter.path) {
        VStack {
                List {
                    ForEach(1..<10, id: \.self) { index in
                        VStack {
                            Text("Number of teamate : \(index)")
                                .onTapGesture {
                                    listTeamateNavigationRouter.navigate(ListTeamateRouter.detailTeamate(id: index))
                                    print("abcccc")
                                }
                        }
                        
                    }
                }
                
            }
            Button("Dismiss Fullscreen") {
                sheetCoordinator.dismissFullScreen()
            }
            
            .navigationDestination(for: ListTeamateRouter.self) { router in
                router.destionation
            }
            
        }
        .injectNavigationRouter(listTeamateNavigationRouter)
        
    }
}
