//
//  ViewController.swift
//  duren
//
//  Created by Baskoro Nugroho on 25/03/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit
import Charts
import Firebase
class ViewController: UIViewController,UIAlertViewDelegate{
    override func viewDidLoad() {
        
    }
    @IBAction func signoutButton(_ sender: Any) {
       
        let alert = UIAlertController(title: "Are you sure to sign out?", message: "That's can make lost your data.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            
            do {
                try Auth.auth().signOut()
                self.navigationController?.popToRootViewController(animated: true)
            } catch {
                print("error: there was a problem while sign out")
            }
            
            print("Yay! You have signout!")
            
            //old way to sign out
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyboard.instantiateViewController(withIdentifier: "Loginscreen") ; // MySecondSecreen the storyboard ID
            self.present(vc, animated: true, completion: nil);
        }))
        self.present(alert, animated: true)
    }
}

