import UIKit
import Flutter
import Openpay

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var openpay : Openpay!

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let openPayChannel = FlutterMethodChannel(name: "openpay.flutter/open_pay")

    openPayChannel.setMethodChannel({
      [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
      guard call.method == "getDeviceSessionId" else {
        result(FlutterMethodNotImplemented)
        return
      }
      self?.reciveDeviseId(result: result)
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func reciveDeviseId(result: FlutterResult) {
    var arguments = call.arguments as! [String]
    print("arguments on ios: \(arguments)")
    let MERCHANT_ID:String = arguments[0]
    let API_KEY:String = arguments[0]

    openpay = Openpay(withMerchantId: MERCHANT_ID, andApiKey: API_KEY, isProductionMode: false, isDebug: false)
    openpay.createDeviceSessionId(successFunction: successSessionID, failureFunction: failSessionID)
  }

  func successSessionID(sessionID: String) {
    print("SessionID: \(sessionID)")
  }

  func failSessionID(error: NSError) {
    print("\(error.code) - \(error.localizedDescription)")
  }

}
