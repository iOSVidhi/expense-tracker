//
//  ExpenseListViewController.swift
//  ExpenseTracker
//
//  Created by MAC105 on 11/09/21.
//

import UIKit

class ExpenseListViewController: UIViewController {

    @IBOutlet weak var tableViewExpenseList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnAddExpense(_ sender: Any) {
        if let expenseTrackerVC = self.storyboard?.instantiateViewController(identifier: "ExpenseTrackerViewController") as? ExpenseTrackerViewController {
            self.navigationController?.pushViewController(expenseTrackerVC, animated: true)
        }
    }
}
extension ExpenseListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath) as! ExpenseTableViewCell
        return cell
    }
}

class ExpenseTableViewCell : UITableViewCell {
    @IBOutlet weak var labelDetail: UILabel!
}
