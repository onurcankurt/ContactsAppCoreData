//
//  AddPersonVC.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import UIKit

class AddPersonVC: UIViewController {
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textfieldPhone: UITextField!
    
    var viewModel = AddPersonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSave(_ sender: Any) {
        if let name = textfieldName.text, let phone = textfieldPhone.text {
            viewModel.save(name: name, phone: phone)
        }
    }
}
