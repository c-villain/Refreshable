import SwiftUI
import Refreshable

struct Constants {
    public static let isPad: Bool = UIDevice.current.userInterfaceIdiom == .pad
}

struct WithRefreshControl: View {
    
    @State private var finalCell: Int = 2
    
    var body: some View {
        ScrollView {
            RefreshControl(Constants.isPad ? .long : .short, coordinateSpace: .named("List")) {
                withAnimation {
                    finalCell += 1
                }
            }

            LazyVStack {
                Text("Refresh control")
                    .font(.title)

                ForEach(1...finalCell, id: \.self) { cell in
                    Text("Cell \(cell)")
                        .frame(height: 50, alignment: .center)
                }
            }
        }
        .coordinateSpace(name: "List")
    }
}
