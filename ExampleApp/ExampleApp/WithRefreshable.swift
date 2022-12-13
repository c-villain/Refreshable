import SwiftUI
import Refreshable

struct WithRefreshable: View {

    @State private var finalCell: Int = 4
    
    var body: some View {
        VStack(spacing: 30) {
            Text("some view ...")
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.pink.opacity(0.3))
            
            LazyVStack {
                Text("Refreshable modifier")
                    .font(.title)
                
                ForEach(1...finalCell, id: \.self) { cell in
                    Text("Cell \(cell)")
                        .font(.title3)
                        .frame(height: 50, alignment: .center)
                }
            }
            .refreshable {
                withAnimation {
                    finalCell = finalCell + 1
                }
            }

        }
    }
}
