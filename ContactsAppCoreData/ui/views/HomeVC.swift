//
//  ViewController.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import UIKit
import CoreData

class HomeVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var personsTableView: UITableView!
    
    let context = appDelegate.persistentContainer.viewContext
    var personList = [PersonInfo]()
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        personsTableView.delegate = self
        personsTableView.dataSource = self
        
        _ = viewModel.personList.subscribe(onNext: { persons in
            self.personList = persons
            self.personsTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadPersons()
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "perconCell") as! PersonCell
        
        cell.cellNameLabel.text = person.name
        cell.cellPhoneLabel.text = person.phone
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personList[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: person)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            if let senderPerson = sender as? PersonInfo {
                let destinationVC = segue.destination as! DetailsVC
                destinationVC.detailsPerson = senderPerson
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let person = personList[indexPath.row]
        
        let deleteSwipeAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let deleteAlert = UIAlertController(title: "Delete", message: "Do you want to delete \(person.name!)", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { alertAction in
                self.viewModel.delete(person: person)
            }
            deleteAlert.addAction(cancelAction)
            deleteAlert.addAction(yesAction)
            
            self.present(deleteAlert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteSwipeAction])
    }
}

