//
//  PasswordViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/2/20.
//

import UIKit
import Firebase

class PasswordViewController: UIViewController {

    // MARK: - Propierties
    var loginControllerDelegate : LoginViewController?
    var loginText : String?
    
    // MARK: - Outlets
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loginText = loginControllerDelegate?.login
    }
    
    // MARK: - Actions
    @IBAction func continueButtonCliked(_ sender: Any) {
        if let login = loginText, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: login, password: password) { (result, error) in
                if (error == nil) {
                    print(login,password)
                } else {
                    print("error in signUp")
                }
            }
        }
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
