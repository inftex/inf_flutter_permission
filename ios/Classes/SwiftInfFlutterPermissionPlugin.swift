import Flutter
import UIKit
import AppTrackingTransparency
import AdSupport

public class SwiftInfFlutterPermissionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "inf_flutter_permission", binaryMessenger: registrar.messenger())
    let instance = SwiftInfFlutterPermissionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // Note: this method is invoked on the UI thread.
    guard call.method == "requestIDFA" else {
        result(FlutterMethodNotImplemented)
        return
    }
    self.requestIDFA()
  }

  func requestIDFA() {
    if #available(iOS 14.0, *) {
      ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
          // Tracking authorization completed. Start loading ads here.
          // loadAd()
      })
    }
  }
}
