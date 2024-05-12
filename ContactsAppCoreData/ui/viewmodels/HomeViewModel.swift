//
//  HomeViewModel.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import Foundation
import RxSwift

class HomeViewModel {
    var prepo = PersonsDaoRepository()
    var personList = BehaviorSubject<[PersonInfo]>(value: [PersonInfo]())
    
    init() {
        personList = prepo.personList
        uploadPersons()
    }
    
    func delete(person: PersonInfo){
        prepo.delete(person: person)
    }
    
    func search(searchText: String){
        prepo.search(searchText: searchText)
    }
    
    func uploadPersons(){
        prepo.uploadPersons()
    }
}
