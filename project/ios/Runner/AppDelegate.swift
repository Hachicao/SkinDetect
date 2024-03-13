import UIKit
import Flutter
import GoogleSignIn 
import SwiftUI
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let clientID = "206785505331-o6ho2if29bj88no4o42tjtpeukh9gbm2.apps.googleusercontent.com"
    let config = GIDConfiguration(clientID: clientID)
    GIDSignIn.sharedInstance.configuration = config
    // let singin = GIDSignIn.sharedInstance
    // singin.clientID = "206785505331-o6ho2if29bj88no4o42tjtpeukh9gbm2.apps.googleusercontent.com"

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   @available(iOS 9.0, *)
    override func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any]
    ) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}