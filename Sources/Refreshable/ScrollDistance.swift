import Foundation

/// Enum that specify the factor to multiply scrolling offset for RefreshControl's responsiveness
public enum ScrollDistance {
    /// defaults: factor is 1.0 without effects
    case defaults
    
    /// short is used for iPhone: factor is 0.9
    case short
    
    /// long is used for iPad: factor is 0.4
    case long
    
    /// custom is used to define your own factor
    /// - Parameter is custom value for factor in range between 0.0 and 1.0
    case custom(CGFloat)
}
