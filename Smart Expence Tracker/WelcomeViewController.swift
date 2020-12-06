//
//  ViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 11/29/20.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Outlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    // MARK: - Actions
    @IBAction func signInButtonClicked(_ sender: Any) {
        Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!) { (result, error) in
            if (error != nil) {
                print("error")
            } else {
                print(self.loginTextField.text,self.passwordTextField.text)
            }
        }
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let con = st.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(con, animated: true)
    }
    
}

