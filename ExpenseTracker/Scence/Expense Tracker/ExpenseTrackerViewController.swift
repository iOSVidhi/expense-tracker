//
//  ExpenseTrackerViewController.swift
//  ExpenseTracker
//
//  Created by MAC105 on 11/09/21.
//

import UIKit

class ExpenseTrackerViewController: UIViewController {

    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldAmount: UITextField!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var textFieldCategory: UITextField!
    @IBOutlet weak var textViewNote: UITextView!
    
    @IBOutlet var viewDate: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
    }
    
    
    @IBAction func didTapOnSaved(_ sender: Any) {
        DBManager.shared.insertMediaProgress(textFieldTitle.text ?? "", Double(textFieldAmount.text ?? "") ?? 0, Date(), textFieldCategory.text ?? "", textViewNote.text ?? "")
    }

}
extension ExpenseTrackerViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
}
