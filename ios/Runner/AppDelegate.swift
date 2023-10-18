import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      self.registerNativeViewFactory()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    private func registerNativeViewFactory() {
        weak var registrar = self.registrar(forPlugin: "native_view_plugin")
        NativeViewEventHandler.register(with: self.registrar(forPlugin: "email_password_event_channel"))
               let factory = NativeViewFactory(messenger: registrar!.messenger())
               self.registrar(forPlugin: "<native_view_plugin>")!.register(
                   factory,
                   withId: "native-view-type")
        
        }
}
