//
//  ViewController.swift
//  duren
//
//  Created by Baskoro Nugroho on 25/03/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController,UIAlertViewDelegate{
    override func viewDidLoad() {
        
    }
    @IBAction func signoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "Loginscreen") ; // MySecondSecreen the storyboard ID
        self.present(vc, animated: true, completion: nil);
        let alert = UIAlertController(title: "Are you sure to sign out?", message: "That's can make lost your data.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            print("Yay! You have signout!")
        }))
        self.present(alert, animated: true)
        
    }
}

