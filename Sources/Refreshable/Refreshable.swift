import SwiftUI

@available(iOS 14.0, *)
public extension View {
    
    @ViewBuilder
    func refreshable(offset: CGFloat = 50, _ action: @escaping () -> ()) -> some View {
        self.modifier(RefreshAction.init(offset: offset, action: action))
    }
}
