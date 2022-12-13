import SwiftUI

@available(iOS 14.0, *)
public struct RefreshAction: ViewModifier {

    private let action: (() -> Void)?
    private let scrollOffset: CGFloat
    
    init(offset: CGFloat = 50, action: @escaping () -> Void) {
        self.scrollOffset = offset
        self.action = action
    }
    
    public func body(content: Content) -> some View {
        ScrollView {
            RefreshControl(coordinateSpace: .named("ContentForRefreshable"), offset: scrollOffset) {
                action?()
            }
            content
        }
        .coordinateSpace(name: "ContentForRefreshable")
    }
    
}
