//
//  AddPersonViewModel.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import Foundation

class AddPersonViewModel {
    var prepo = PersonsDaoRepository()
    
    func save(name: String, phone: String){
        prepo.save(name: name, phone: phone)
    }
}
