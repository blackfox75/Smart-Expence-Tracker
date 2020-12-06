//
//  LoginViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/2/20.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    // MARK: - Properties
    var passwordController : PasswordViewController?
    var login : String?
    // MARK: - Outlets
    @IBOutlet weak var loginTextField: UITextField!
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    // MARK: - Actions
    
    @IBAction func countinueButtonClicked(_ sender: Any) {
        
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let con = st.instantiateViewController(withIdentifier: "PasswordViewController") as! PasswordViewController
        con.loginControllerDelegate = self // почему ее именно тут нужно писать?
        login = loginTextField.text
        navigationController?.pushViewController(con, animated: true)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
