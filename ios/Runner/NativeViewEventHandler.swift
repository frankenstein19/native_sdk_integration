//
//  NativeViewEventHandler.swift
//  Runner
//
//  Created by Rahul Sharma on 18/10/23.
//

import Foundation

import Flutter

class NativeViewEventHandler: NSObject, FlutterStreamHandler {
    @objc func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink=events
        return nil
        
    }
    
    @objc func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink=nil
        return nil
    }
    
    var eventSink: FlutterEventSink?
    
    // Singleton pattern to access YourNativeClass from outside
    static var shared: NativeViewEventHandler?

    static func register(with registrar: FlutterPluginRegistrar?) {
        if(registrar==nil){
            return
        }
        let channel = FlutterEventChannel(name: "email_password_event_channel", binaryMessenger: registrar!.messenger())
        let instance = NativeViewEventHandler()
        channel.setStreamHandler(instance)
        
        // Set the shared instance to make YourNativeClass accessible from outside
        shared = instance
    }

    // ... (rest of the code remains unchanged)

    // Method to receive data from outside and send it to Flutter
    func sendDataToFlutter(email: String?, password: String?) {
        // Send data to Flutter
        self.eventSink?([ "email": email, "password": password ])
    }
}
