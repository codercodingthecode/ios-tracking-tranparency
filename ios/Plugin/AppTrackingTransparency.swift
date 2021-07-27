import Foundation
import AppTrackingTransparency

@objc public class AppTrackingTransparency: NSObject {
    @objc public func echo(_ value: String) -> String {
        return value
    }
    
    @objc func trackingAuthorizationStatus(_ value: String) -> String {
      return value
    }
    
    @objc func requestTrackingAuthorization(_ value: String) -> String {
      return value
    }
}
