//
//  ResetPasswordViewController.swift
//  DashCam
//
//  Created by Mark Park on 12/20/21.
//

import UIKit
import SwiftUI
import Firebase

class ResetPasswordViewController : UIViewController {
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func sendEmailButton(_ sender: Any) {
        if let email = emailAddressTextField.text{
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                if let e = error {
                    let message = e.localizedDescription
                    let alert = UIAlertController(title: "Oh no!", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    self.performSegue(withIdentifier: "returnToLogin", sender: self)
                    let alert = UIAlertController(title:"User found! Please reset your password!", message:"An email has been sent to " + email + ".", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue to Login", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.emailAddressTextField.text = ""
                }
                
            }
        }
    }
}
