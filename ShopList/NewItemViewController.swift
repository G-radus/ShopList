//
//  ViewController.swift
//  ShopList
//
//  Created by Rustam Gradov on 22/05/2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import UIKit
import CoreData

protocol NewItemViewControllerDelegate: class {
    func itemCreated(_ item: Items)
}

class NewItemViewController: UIViewController {
    
    weak var  delegate: NewItemViewControllerDelegate?
    
    @IBOutlet weak var newItemTextField: UITextField!
    @IBOutlet weak var labelCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        labelCount.text = Int(sender.value).description
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        guard let itemTitle = newItemTextField.text, let count = Int(labelCount.text!) else { return }
        
        let item = Items(itemTitle: itemTitle, count: count)
        
        delegate?.itemCreated(item)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        newItemTextField.becomeFirstResponder()
    }
}

