import Foundation
import Capacitor
import AppTrackingTransparency
import UIKit



/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AppTrackingTransparencyPlugin)
public class AppTrackingTransparencyPlugin: CAPPlugin {
    private let implementation = AppTrackingTransparency()
    
    private func returnStatus(code: UInt) -> String {
        switch code {
        case 0:
            return "notDetermined";
        case 1:
            return "restritect";
        case 2:
            return "denied";
        case 3:
            return "authorized";
        default:
            return "null";
        }
    }
    
    @objc func trackingAuthorizationStatus(_ call: CAPPluginCall) {
        if #available(iOS 14.0, *) {
            let status = ATTrackingManager.trackingAuthorizationStatus;
            call.resolve([
                "status": returnStatus(code: status.rawValue),
                "code": status.rawValue
            ])
        }
    }
    
    @objc  func requestTrackingAuthorization(_ call: CAPPluginCall)  {
        if #available(iOS 14.0, *) {
            ATTrackingManager.requestTrackingAuthorization() { [self] stat in
                call.resolve([
                    "status": returnStatus(code: stat.self.rawValue),
                    "code": stat.rawValue
                ])
            }
            
        } else {
            call.resolve(["status": "null", "code": 5])
        }
    }
}
