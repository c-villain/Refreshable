import SwiftUI

@available(iOS 14.0, *)
public struct RefreshControl: View {
    
    private let coordinateSpace: CoordinateSpace
    
    private let scrollOffset: CGFloat
    private let factor: CGFloat
    
    private let onRefresh: () -> Void
    
    @State private(set) var refresh: Bool = false
    
    public init(coordinateSpace: CoordinateSpace,
                offset: CGFloat = 50,
                onRefresh: @escaping (() -> Void)) {
        self.coordinateSpace = coordinateSpace
        self.onRefresh = onRefresh
        self.scrollOffset = offset
        self.factor =  offset / scrollOffset
    }
    
    public var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: coordinateSpace).midY > scrollOffset) {
                Spacer()
                    .onAppear {
                        if refresh == false {
                            onRefresh() ///call refresh once if pulled more than 50px
                        }
                        refresh = true
                    }
            } else if (geo.frame(in: coordinateSpace).maxY < 1) {
                Spacer()
                    .onAppear {
                        refresh = false
                        ///reset  refresh if view shrink back
                    }
            }
            
            ZStack(alignment: .center) {
                if refresh { ///show loading if refresh called
                    ProgressView()
                } else { ///mimic static progress bar with filled bar to the drag percentage
                    ForEach(0..<8) { tick in
                          VStack {
                              Rectangle()
                                .fill(Color(UIColor.tertiaryLabel))
                                .opacity((Int((geo.frame(in: coordinateSpace).midY * factor)/7) < tick) ? 0 : 1)
                                  .frame(width: 3, height: 7)
                                .cornerRadius(3)
                              Spacer()
                      }.rotationEffect(Angle.degrees(Double(tick)/(8) * 360))
                   }.frame(width: 20, height: 20, alignment: .center)
                }
            }.frame(width: geo.size.width)
        }.padding(.top, -scrollOffset)
    }
}

@available(iOS 14.0, *)
struct PullToRefreshDemo: View {
    var body: some View {
        ScrollView {
            RefreshControl(coordinateSpace: .named("RefreshControl")) {
                //refresh view here
            }
            Text("Some view...")
        }.coordinateSpace(name: "RefreshControl")
    }
}

@available(iOS 14.0, *)
struct PullToRefreshDemo_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshDemo()
    }
}


