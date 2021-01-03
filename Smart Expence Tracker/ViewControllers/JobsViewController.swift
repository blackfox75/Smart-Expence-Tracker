//
//  JobsViewController.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/12/20.
//

import UIKit
import CoreData

class JobsViewController: UIViewController {
    
    var question = QuestionsViewController()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let cellDC = "DebitCardCell"
    let cellJobs = "jobsTableViewCell"
    
    
    //Data of the table
//    var items : [JobData]?
    var items : [DebitCardData]?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: cellDC, bundle: nil), forCellReuseIdentifier: cellDC)
        fetchData()
    }
    
    func fetchData() {
        // Fetch the data from Core Data to dsiplay in the tableView
        do {
            self.items = try context.fetch(DebitCardData.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            
        }
    }
    
    
}

extension JobsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items?.count ?? 0
//        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellDC, for: indexPath) as! DebitCardCell
        let job = self.items?[indexPath.row]
        
        cell.debitCardName.text = job?.debitCardName
        cell.debitCardMoney.text = String(job!.debitCardAmountOfMoney) + "$"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            // Which person to remove
            let debitCardToRemove = self.items![indexPath.row]
            // Remove person
            self.context.delete(debitCardToRemove)
            //Save the data
            do {
                try self.context.save()
            } catch {
                
            }
            //Re-fetch the data
            self.fetchData()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Selected Person
        let debitCard = self.items![indexPath.row]

        //Create alert
        let alert = UIAlertController(title: "Edit Card", message: "", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        
        let textField = alert.textFields![0]
        textField.text = debitCard.debitCardName
        
        let secondTextField = alert.textFields![1]
        secondTextField.text = String(debitCard.debitCardAmountOfMoney)

        //Configure button handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in

            //Get the textfield for the alert
            let textField = alert.textFields![0]
            let secondTextField = alert.textFields![1]
            
            //Edit name property of person object
            debitCard.debitCardName = textField.text
            debitCard.debitCardAmountOfMoney = Double(secondTextField.text!)!
            
            //Save the data
            do {
                try self.context.save()
            } catch {

            }

            //Refetch the data
            self.fetchData()
        }

        //Add button
        alert.addAction(saveButton)

        //Show alert
        self.present(alert, animated: true, completion: nil)
    }
    
}

