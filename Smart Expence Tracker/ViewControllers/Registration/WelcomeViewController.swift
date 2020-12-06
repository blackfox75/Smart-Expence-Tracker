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
                print(self.loginTextField.text as Any,self.passwordTextField.text as Any)
                self.navigationController?.pushViewController(PasswordViewController.getfromStoryBoard(withId: "QuestionsViewController") as! QuestionsViewController, animated: true) 
            }
        }
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        navigationController?.pushViewController(WelcomeViewController.getfromStoryBoard(withId: "LoginViewController") as! LoginViewController, animated: true)
    }
    
}

