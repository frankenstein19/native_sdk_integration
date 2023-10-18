//
//  NativeViewFactory.swift
//  Runner
//
//  Created by Rahul Sharma on 17/10/23.
//

import Foundation
import Flutter
import UIKit

class NativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return NativeView(
            frame: frame,
            viewId: viewId,
            args: args,
            messenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class NativeView: NSObject, FlutterPlatformView{

    private var _view: UIView!
    let emailTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Email"
            textField.borderStyle = .roundedRect
            return textField
        }()
        
        let passwordTextField: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Password"
            textField.borderStyle = .roundedRect
            textField.isSecureTextEntry = true
            return textField
        }()
    let loginButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Login", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.white
           return button
       }()

      init(frame: CGRect, viewId: Int64, args: Any?, messenger: FlutterBinaryMessenger) {
          super.init()
        
          let container = UIView(frame: frame)
          
         
          container.addSubview(emailTextField)
          container.addSubview(passwordTextField)
          container.addSubview(loginButton)
                 
                 // Layout constraints
                 emailTextField.translatesAutoresizingMaskIntoConstraints = false
          emailTextField.topAnchor.constraint(equalTo: container.topAnchor, constant: 20).isActive = true
          emailTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
          emailTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
          emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
              

                 passwordTextField.translatesAutoresizingMaskIntoConstraints = false
                 passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
          passwordTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
          passwordTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
          passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
                 
                 loginButton.translatesAutoresizingMaskIntoConstraints = false
                 loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
          loginButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
          loginButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
          loginButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
          self._view = container
      }
    
    @objc func emailTextFieldDidChange(_ textField: UITextField) {
            // Handle email text field value change here
            if let email = textField.text {
                NativeViewEventHandler.shared?.sendDataToFlutter(email: email, password: passwordTextField.text)
            }
        }

        @objc func passwordTextFieldDidChange(_ textField: UITextField) {
            // Handle password text field value change here
            if let password = textField.text {
                NativeViewEventHandler.shared?.sendDataToFlutter(email: emailTextField.text, password: password)
            }
        }
    
    

    func view() -> UIView {
        return _view
    }

 
}
