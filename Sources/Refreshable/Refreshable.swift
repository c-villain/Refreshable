import SwiftUI

@available(iOS 14.0, *)
public extension View {
    
    @ViewBuilder
    func refreshable(_ scrollDistance: ScrollDistance = .defaults,
                     _ action: @escaping () -> ()) -> some View {
        self.modifier(RefreshAction.init(
            scrollDistance,
            action: action))
    }
}
