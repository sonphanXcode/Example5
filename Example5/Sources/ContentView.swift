import SwiftUI
import NavigationRouter

public struct ContentView: View {
    @StateObject var navigationRouter: NavigationRouter = .init()
    @StateObject var sheetCoordinator: SheetCoordinator = .init()
    
    public init() {}

    public var body: some View {
        TabView {
            NavigationStack(path: $navigationRouter.path) {
                WelcomeView()
                    .setupMultiNavigationDestination()
            }
            .fullScreenCover(item: $sheetCoordinator.currentFullScreen, content: { $0.fullscreen?.destination })
            .sheet(item: $sheetCoordinator.currentSheet, content: { $0.sheet?.destination })
            .injectNavigationRouter(navigationRouter)
            .injectSheetCoordinator(sheetCoordinator)
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("Profile View")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    public func setupMultiNavigationDestination() -> some View {
        self.navigationDestination(for: WelcomeRouter.self) { $0.destionation }
        .navigationDestination(for: ConfirmRouter.self) { $0.destionation }
    }
}
