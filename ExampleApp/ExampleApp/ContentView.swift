import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WithRefreshControl()
                .tabItem {
                    Label("Control", systemImage: "list.dash")
                }
            
            WithRefreshable()
                .tabItem {
                    Label("Modifier", systemImage: "list.dash")
                }
        }
        .ignoresSafeArea()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
