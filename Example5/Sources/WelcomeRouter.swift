//
//  WelcomeRouter.swift
//  iOS
//
//  Created by sp7 on 8/6/26.
//

import Foundation
import NavigationRouter
import SwiftUI
import S7DI

enum WelcomeRouter {
    case welcome, detail
}

extension WelcomeRouter: Routable {
    var destionation: AnyView {
        switch self {
        case .welcome:
            AnyView(WelcomeView())
        case .detail:
            AnyView(DetailView())
        }
    }
}

// ConfirmRouter
enum ConfirmRouter {
    case confirmView, result
}

extension ConfirmRouter: Routable {
    var destionation: AnyView {
        switch self {
        case .confirmView:
            AnyView(ConfirmView())
        case .result:
            AnyView(ResultView())
        }
    }
}

// s
enum WelcomeModal {
    case popup1
}

extension WelcomeModal: Sheetable {
    
    var destination: AnyView {
        switch self {
        case .popup1:
            return AnyView(ModalView())
        }
    }
}

struct ModalView: View {
    @Environment(\.sheetCoordinator) var sheetCoordinator
    
    var body: some View {
        VStack {
            Text("Modal View")
            Spacer()
            Button("Dismiss") {
                sheetCoordinator.dismiss()
                
            }
            Spacer()
        }
    }
}

struct WelcomeView: View {
    
    @Environment(\.navigationRouter) var navigationRouter
    @Environment(\.sheetCoordinator) var sheetCoordinator
    
    var body: some View {
        VStack {
            Text("Welcome View + network: \(getNetworkID())")
            Spacer()
            Button("Navigating to Detail") {
                navigationRouter.navigate(WelcomeRouter.detail)
            }
            Button("Present modal") {
                sheetCoordinator.show(WelcomeModal.popup1)
            }
            
            Button("Show FullScreen") {
                sheetCoordinator.showFullScreen(ListTeamateAlert.listTeamate)
            }
            Spacer()
                .frame(height: 100)
        }
        .padding()
        
    }
    
    private func getNetworkID() -> String {
        let network = S7DIContainer.shared.resolve(type: Network.self)
        return network?.urlSession ?? ""
    }
}

struct DetailView: View {
    
    @Environment(\.navigationRouter) var navigationRouter
    @Environment(\.sheetCoordinator) var sheetCoordinator
    
    var body: some View {
        VStack {
            Spacer()
            Text("Detail View")
            HStack {
                Spacer()
                Button("Pop") {
                    navigationRouter.pop()
                }
                Spacer()
                Button("Go to ConfirmView") {
                    navigationRouter.navigate(ConfirmRouter.confirmView)
                }
                Spacer()
            }
            Button("Show list teamate modal") {
                sheetCoordinator.showFullScreen(ListTeamateAlert.listTeamate)
            }
            Spacer()
        }
        .padding()
    }
}

struct ConfirmView: View {
    @Environment(\.navigationRouter) var navigationRouter
    var body: some View {
        VStack {
            Spacer()
            Text("Confirm View")
            Spacer()
            HStack {
                Spacer()
                Button("Go to Result View") {
                    navigationRouter.navigate(ConfirmRouter.result)
                }
                Button("Pop to Detail View") {
                    navigationRouter.pop()
                }
                Spacer()
                Button("PopToRoot") {
                    navigationRouter.popToRoot()
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ResultView: View {
    @Environment(\.navigationRouter) var navigationRouter
    var body: some View {
        VStack {
            Spacer()
            Text("Result View")
            Spacer()
            HStack {
                Spacer()
                Button("Pop To Confirm") {
                    navigationRouter.pop()
                }
                Spacer()
                Button("PopToRoot") {
                    navigationRouter.popToRoot()
                }
                Spacer()
            }
        }
    }
}

