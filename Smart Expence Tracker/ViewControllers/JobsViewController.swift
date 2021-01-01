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
    let cellM = "MoneyCell"
    
    //Data of the table
    var items : [UserData]?
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: cellM, bundle: nil), forCellReuseIdentifier: cellM)
        fetchData()
    }
    
    func fetchData() {
        // Fetch the data from Core Data to dsiplay in the tableView
        do {
            self.items = try context.fetch(UserData.fetchRequest())
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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellM, for: indexPath) as! MoneyCell
        let person = self.items?[indexPath.row]
        
        cell.nameLabel.text = person?.name
        cell.secondLabel.text = person?.name
        
        return cell
    }
    
    
}

