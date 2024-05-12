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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSave(_ sender: Any) {
        if let name = textfieldName.text, let phone = textfieldPhone.text {
            print("\(name)-\(phone) saved.")
        }
    }
}
