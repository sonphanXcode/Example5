//
//  DetailTeamateView.swift
//  iOS
//
//  Created by sp7 on 10/6/26.
//

import Foundation
import SwiftUI
import NavigationRouter

struct DetailTeamateView: View {
    
    @Environment(\.navigationRouter) var navigationRouter
    @Environment(\.sheetCoordinator) var sheetCoordinator
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Text("Detail of Teamate the number : \(number)")
                Text("Description About Teamate")
                Text("ST CD CM")
                
                Button("Back to List") {
                    navigationRouter.pop()
                }
                
                Button("Dismiss") {
                    sheetCoordinator.dismissFullScreen()
                }
            }
            .padding()
        }
        
    }
}
