import SwiftUI

@available(iOS 14.0, *)
public struct RefreshAction: ViewModifier {

    private let action: (() -> Void)?
    private let scrollDistance: ScrollDistance
    
    init(_ scrollDistance: ScrollDistance = .defaults,
         action: @escaping () -> Void) {
        self.scrollDistance = scrollDistance
        self.action = action
    }
    
    public func body(content: Content) -> some View {
        ScrollView {
            RefreshControl(scrollDistance,
                           coordinateSpace: .named("ContentForRefreshable")) {
                action?()
            }
            content
        }
        .coordinateSpace(name: "ContentForRefreshable")
    }
    
}
