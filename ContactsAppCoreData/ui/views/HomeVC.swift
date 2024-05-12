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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        personsTableView.delegate = self
        personsTableView.dataSource = self
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Searching: \(searchText)")
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
}

