//
//  DetailsViewModel.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import Foundation

class DetailsViewModel {
    var prepo = PersonsDaoRepository()
    
    func update(person: PersonInfo, name: String, phone: String){
        prepo.update(person: person, name: name, phone: phone)
    }
}
