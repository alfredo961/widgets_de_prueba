import UIKit
import Flutter
import GoogleMaps
import UserNotifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyAh49u9TthjJeIZavoVrDklMhjgHfLEZS8")
    GeneratedPluginRegistrant.register(with: self)

    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
