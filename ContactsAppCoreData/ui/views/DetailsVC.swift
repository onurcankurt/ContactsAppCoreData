//
//  DetailsVC.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import UIKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textfieldPhone: UITextField!
    
    var detailsPerson: PersonInfo?
    var viewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let person = detailsPerson{
            textfieldName.text = person.name
            textfieldPhone.text = person.phone
        }
    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        if let name = textfieldName.text, let phone = textfieldPhone.text {
            viewModel.update(person: detailsPerson!, name: name, phone: phone)
        }
    }
}
