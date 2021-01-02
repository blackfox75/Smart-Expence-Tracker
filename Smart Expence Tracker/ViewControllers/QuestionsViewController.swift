//
//  QuestionsViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/6/20.
//

import UIKit
import CoreData


enum Questions {
    case first
    
    case company
    case moreJobs
    case nameOfDebitCard
    case moreDebitCards
    case mounthlySpent
    case moreMounthlySpent
    case nextController
}

class QuestionsViewController: UIViewController {
    // MARK: - Propierties
    private var userInfo = User() {
        didSet {
            print(userInfo)
        }
    }
    private var countOfJobs : Int = 0
    private var currentJobIndex : Int = 0
    private var masOfUserInfo : [User] = []
    private var userStates : UserState = .company
    private var jobInfo : Job?
    private var debitCardInfo : DebitCard?
    private var mounthlySpentInfo : MounthlySpent?
    private var stateForYesOrNo : String = "company"
    
    //For CoreData
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items: [UserData]?
    
    lazy private var questionList: [String] = ["What name of your current job?","Do you have more jobs?", "What name of your main debit card?","Do you have more debit cards?", "What your mounthly spent?", "Do you have more mounthly spent?","Congratulations, you ready for use Smart Expence Tracker"]
    private var questionNum: Int = -1 {
        didSet {
            if questionNum < questionList.count {
                hiLabel.text = questionList[questionNum]
            }
            switch questionNum {
            
            case 1:
                userStates = .company
                currentQuestion = .company
            case 2:
                userStates = .moreJobs
                currentQuestion = .moreJobs
            case 3:
                userStates = .nameOfDebitCard
                currentQuestion = .nameOfDebitCard
            case 4:
                userStates = .moreDebitCards
                currentQuestion = .moreDebitCards
            case 5:
                userStates = .mounthlySpent
                currentQuestion = .mounthlySpent
            case 6:
                currentQuestion = .moreMounthlySpent
            case 7:
                currentQuestion = .nextController
            default:
                break
            }
            
        }
    }
    
    private var currentQuestion: Questions = .first
    
    private var datePicker : UIDatePicker?
    private var yesOrNo : Bool = true
    // MARK: - Outlets
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var secondInputText: UITextField!
    @IBOutlet weak var thirdInputText: UITextField!
    @IBOutlet weak var firstTextFieldView: UIView!
    @IBOutlet weak var secondTextFieldView: UIView!
    @IBOutlet weak var thirdTextFieldView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    
    
    // MARK: - Actions
    @IBAction func continueClicked(_ sender: Any) {
        questionNum += 1
        updateUI()
        print("questionNum - ", questionNum)
        inputText.text = ""
        secondInputText.text = ""
        thirdInputText.text = ""
    }
    
    
    @IBAction func yesButtonClicked(_ sender: Any) {
        yesOrNo = true
        if (stateForYesOrNo == "company") {
            userStates = .moreJobs
            currentQuestion = .moreJobs
            updateUI()
        } else if (stateForYesOrNo == "debitCards") {
            userStates = .moreDebitCards
            currentQuestion = .moreDebitCards
            updateUI()
        } else if (stateForYesOrNo == "mounthlySpent") {
            currentQuestion = .mounthlySpent
            updateUI()
        }
        
    }
    
    @IBAction func noButtonClicked(_ sender: Any) {
        yesOrNo = false
        if (stateForYesOrNo == "company") {
            currentQuestion = .moreJobs
            updateUI()
        } else if (stateForYesOrNo == "debitCards") {
            currentQuestion = .moreDebitCards
            updateUI()
        } else if (stateForYesOrNo == "mounthlySpent") {
            currentQuestion = .moreMounthlySpent
            updateUI()
        }
    }
    
    // MARK: - Function
    func setupNavigationBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        thirdInputText.inputAccessoryView = toolbar
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.preferredDatePickerStyle = .wheels
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(QuestionsViewController.dateChanged(datePicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(QuestionsViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        thirdInputText.inputView = datePicker
        datePicker?.datePickerMode = .date
    }
    
    @objc func donePressed() {
        let forrmater = DateFormatter()
        forrmater.dateStyle = .medium
        forrmater.timeStyle = .none
        forrmater.dateFormat = "MM/dd/yyyy"
        thirdInputText.text = forrmater.string(from: datePicker!.date)
        self.view.endEditing(true)
    }
    
    @objc func viewTapped(gestureRecognizer : UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateForrmater = DateFormatter()
        dateForrmater.dateFormat = "MM/dd/yyyy"
        thirdInputText.text = dateForrmater.string(from: datePicker.date)
    }
    
    func updateUI() {
        switch currentQuestion {
        case .company:
            jobInfo = Job(name: inputText.text ?? "", salary: Int(secondInputText.text ?? "0") ?? 0)
            userInfo.job.append(jobInfo!)
            //This is how to add info in CoreData
            //Create a person Object
            let newUser = UserData(context: self.context)
            newUser.name = inputText.text
            
            //Try to create Data+CoreData for working with jobs
//            let newJob = JobData(context: self.context)
//            newUser.job[0].append(inputText.text)
            
            //Save the data
            do {
                try self.context.save()
            } catch {
                print("Error")
            }
            
            firstTextFieldView.isHidden = true
            secondTextFieldView.isHidden = true
            yesButton.isHidden = false
            noButton.isHidden = false
            continueButton.isHidden = true
            stateForYesOrNo = "company"
        case .moreJobs:
            if yesOrNo {
                navigationController?.pushViewController(UIViewController.getfromStoryBoard(withId: "JobsViewController"), animated: true)
            } else {
                questionNum += 1
                inputText.text = ""
                secondInputText.text = ""
                thirdInputText.text = ""
                firstTextFieldView.isHidden = false
                secondTextFieldView.isHidden = false
                yesButton.isHidden = true
                noButton.isHidden = true
                continueButton.isHidden = false
            }
        case .nameOfDebitCard:
            debitCardInfo = DebitCard(debitCardName: inputText.text ?? "", debitCardAmountOfMoney: Double(secondInputText.text ?? "0.0") ?? 0.0)
            userInfo.debitCard.append(debitCardInfo!)
            
            firstTextFieldView.isHidden = true
            secondTextFieldView.isHidden = true
            yesButton.isHidden = false
            noButton.isHidden = false
            continueButton.isHidden = true
            stateForYesOrNo = "debitCards"
            
        case .moreDebitCards:
            if yesOrNo {
                navigationController?.pushViewController(UIViewController.getfromStoryBoard(withId: "JobsViewController"), animated: true)
            } else {
                questionNum += 1
                inputText.text = ""
                secondInputText.text = ""
                thirdInputText.text = ""
                firstTextFieldView.isHidden = false
                secondTextFieldView.isHidden = false
                thirdTextFieldView.isHidden = false
                yesButton.isHidden = true
                noButton.isHidden = true
                continueButton.isHidden = false
            }
            
        case .mounthlySpent:
            thirdTextFieldView.isHidden = false
            mounthlySpentInfo = MounthlySpent(mounthlySpentName: inputText.text ?? "", mounthlySpentSum: Int(secondInputText.text ?? "0") ?? 0, mounthlySpentDate: datePicker!.date)
            userInfo.mounthlySpent.append(mounthlySpentInfo!)
            
            inputText.text = ""
            secondInputText.text = ""
            thirdInputText.text = ""
            firstTextFieldView.isHidden = true
            secondTextFieldView.isHidden = true
            thirdTextFieldView.isHidden = true
            yesButton.isHidden = false
            noButton.isHidden = false
            continueButton.isHidden = true
            stateForYesOrNo = "mounthlySpent"
            
        case .moreMounthlySpent:
            if yesOrNo {
                navigationController?.pushViewController(UIViewController.getfromStoryBoard(withId: "JobsViewController"), animated: true)
            } else {
                questionNum += 1
                firstTextFieldView.isHidden = true
                secondTextFieldView.isHidden = true
                thirdTextFieldView.isHidden = true
                yesButton.isHidden = true
                noButton.isHidden = true
                continueButton.isHidden = false
            }
        case .nextController:
            navigationController?.pushViewController(UIViewController.getfromStoryBoard(withId: "JobsViewController"), animated: true)
            
        case .first:
            print("first")
            firstTextFieldView.isHidden = false
            secondTextFieldView.isHidden = false
        }
        //        print(userInfo)
    }
    
    
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        setupNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    
    
}

