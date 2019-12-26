//
//  ViewController.swift
//  ITable
//
//  Created by Admin on 08.12.2019.
//  Copyright © 2019 amci. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseCoreDiagnostics
import FirebaseCore
import FirebaseAnalytics
import FirebaseInstanceID

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonLogIn: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTextFields()
        setUpButtons()
    }
    
    
    private func setUpTextFields() {
        textFieldEmail.placeholder = "Email"
        textFieldEmail.isSecureTextEntry = false
        textFieldEmail.layer.cornerRadius = textFieldEmail.frame.size.height / 8
        textFieldEmail.layer.borderColor = UIColor.blue.cgColor
        textFieldEmail.layer.shadowColor = UIColor.black.cgColor
        textFieldEmail.layer.shadowRadius = 10
        textFieldEmail.layer.shadowOpacity = 0.1
        textFieldEmail.layer.shadowOffset = CGSize(width: -3, height: -3)
        
        textFieldPassword.placeholder = "Password"
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.layer.cornerRadius = textFieldPassword.frame.size.height / 8
        textFieldPassword.layer.borderColor = UIColor.blue.cgColor
        textFieldPassword.layer.shadowColor = UIColor.black.cgColor
        textFieldPassword.layer.shadowRadius = 10
        textFieldPassword.layer.shadowOpacity = 0.1
        textFieldPassword.layer.shadowOffset = CGSize(width: -3, height: -3)
    }
    
    
    private func setUpButtons() {
        buttonLogIn.layer.cornerRadius = buttonLogIn.frame.size.height / 2
        buttonSignUp.layer.cornerRadius = buttonSignUp.frame.size.height / 2
    }
    
    
    @IBAction func touchDownSignIn(_ sender: Any) {
        // FIXME: Delete this (Debug code (No enter email and password))
        self.goCurrentDayPage()
        
        guard
          let email    = textFieldEmail.text,
          let password = textFieldPassword.text,
          email.count > 0,
          password.count > 0
          else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error, user == nil {
                UICustomAlert.show(viewController: self,
                                   title: "Sign In Failed!",
                                   message: error.localizedDescription)
            } else {
                // FIXME: Save user data
                self.goCurrentDayPage()
            }
        }
    }
    
    
    @IBAction func touchDownSignUp(_ sender: Any) {
        guard
          let email    = textFieldEmail.text,
          let password = textFieldPassword.text,
          email.count > 0,
          password.count > 0
          else {
            return
        }
        
        Auth.auth().createUser(withEmail: textFieldEmail.text!, password: textFieldPassword.text!) { user, error in
            if let error = error {
                UICustomAlert.show(viewController: self,
                                   title: "Sign Up Failed!",
                                   message: error.localizedDescription)
            } else {
                Auth.auth().signIn(withEmail: self.textFieldEmail.text!, password: self.textFieldPassword.text!)
                // FIXME: Save user data
                self.goCurrentDayPage()
            }
        }
    }
    
    
    private func goCurrentDayPage() {
        let storyBoard = UIStoryboard(name: "TimeTable", bundle: nil)
        
        let next = storyBoard.instantiateViewController(withIdentifier: "TimeTable")
        next.modalPresentationStyle = .fullScreen
        self.present(next, animated: true, completion: nil)
    }
    
}
