import SwiftUI
import S7DI

@main
struct Example5App: App {
    
    private let s7DI = S7DIContainer.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .registerObjects()
        }
    }
}

extension View {
    func registerObjects() -> AnyView {
        let network = Network()
        S7DIContainer.shared.register(type: Network.self) {
            network
        }
        return AnyView(self)
    }
}
