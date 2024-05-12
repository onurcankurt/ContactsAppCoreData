//
//  PersonsDaoRepository.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import Foundation
import CoreData
import RxSwift

class PersonsDaoRepository {
    var personList = BehaviorSubject<[PersonInfo]>(value: [PersonInfo]())
    let context = appDelegate.persistentContainer.viewContext
    
    
    
    func save(name: String, phone: String){
        let person = PersonInfo(context: context)
        person.name = name
        person.phone = phone
        appDelegate.saveContext()
    }
    
    func update(person: PersonInfo, name: String, phone: String){
        person.name = name
        person.phone = phone
        appDelegate.saveContext()
    }
    
    func delete(person: PersonInfo){
        context.delete(person)
        appDelegate.saveContext()
        uploadPersons()
    }
    
    func search(searchText: String){
        do{
            let fr = PersonInfo.fetchRequest()
            fr.predicate = NSPredicate(format: "name CONTAINS[c] %@", searchText)
            let list = try context.fetch(fr)
            personList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func uploadPersons(){
        do{
            let list = try context.fetch(PersonInfo.fetchRequest())
            personList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
    }
}
