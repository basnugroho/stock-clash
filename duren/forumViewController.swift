//
//  forumViewController.swift
//  duren
//
//  Created by Aditia sugiarto Prajitno on 29/03/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit

class forumViewController: UITableViewController {

    let cars = ["Honda Jazz", "Honda Brio", "Toyota Agya", "Toyota Yaris"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula",
                                                 for: indexPath)
        
        cell.textLabel?.text = cars[indexPath.row]
        
        return cell
    }
    
    // MARK: - TableView functions
    
    override func tableView(_ tableView: UITableView,
                            didDeselectRowAt indexPath: IndexPath) {
        
        print("User select: section#\(indexPath.section)-row#\(indexPath.row)")
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
