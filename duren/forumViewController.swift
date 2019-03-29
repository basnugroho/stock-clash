//
//  forumViewController.swift
//  duren
//
//  Created by Aditia sugiarto Prajitno on 29/03/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit

class forumViewController: UITableViewController {

    let cars = [" Jazz", " Brio", " Agya", " Yaris"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        
        cell.textLabel?.text = cars[indexPath.row]
        
        return cell
    }
    
    // MARK: - TableView functions
    
    override func tableView(_ tableView: UITableView,
                            didDeselectRowAt indexPath: IndexPath) {
        
        print("User select: section#\(indexPath.section)-row#\(indexPath.row)")
    }
    

}
