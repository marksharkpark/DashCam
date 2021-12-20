//
//  ViewController.swift
//  DashCam
//
//  Created by Mark Park on 10/29/21.
//

import UIKit
import SwiftUI
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        emailTextField.layer.cornerRadius = 22
        signInButton.layer.cornerRadius = 22
        registerButton.layer.cornerRadius = 22
        passwordTextField.layer.cornerRadius = 22
    }
    
    @IBAction func resetPasswordPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "PasswordReset", sender: self)
        
    }
    @IBAction func signInButtonPressed(_ sender: Any) {
        // Optional chaining
        if let email = emailTextField.text,  let password = passwordTextField.text{
            // Begin Firebase Authentication
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let message = e.localizedDescription
                    let alert = UIAlertController(title: "Oh no!", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.emailTextField.text?.removeAll() // erasing entry
                    self.passwordTextField.text?.removeAll() // erasing entry
                } else {
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
            }
        }
    }
    

    @IBAction func registerButtonPressed(_ sender: Any) {
        // Optional chaining
        if let email = emailTextField.text,  let password = passwordTextField.text{
            // Begin Firebase Authentication
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let message = e.localizedDescription
                    let alert = UIAlertController(title: "Oh no!", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.emailTextField.text?.removeAll() // erasing entry
                    self.passwordTextField.text?.removeAll() // erasing entry
                } else {
                    self.performSegue(withIdentifier: "LoginSegue", sender: self)
                }
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
