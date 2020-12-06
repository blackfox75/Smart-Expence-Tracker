//
//  QuestionsViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/6/20.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - Propierties
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var hiLabelOutlet: UILabel!
    @IBOutlet weak var firstLabelOutlet: UITextField!
    @IBOutlet weak var firstTextFieldView: UIView!
    
    
    
    // MARK: - Actions
    @IBAction func continueClicked(_ sender: Any) {
        firstTextFieldView.isHidden = false
        hiLabelOutlet.text = "What your current job?"
        firstLabelOutlet.placeholder = "Current Job"
        
        firstLabelOutlet.isHidden = false
    }
    
    
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

}
