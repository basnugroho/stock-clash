//
//  SignupViewController.swift
//  duren
//
//  Created by Leonardo Jeffry on 02/04/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit
import CoreData
import Firebase

class SignupViewController: UIViewController,UITextFieldDelegate {
    //@IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        //let username = usernameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        
        let command  = NSManagedObject(entity: entity!, insertInto: context)
        
        //command.setValue(username, forKey: "username")
        command.setValue(email, forKey: "email")
        command.setValue(password, forKey: "password")
        
        do {
            try context.save()
            print("Register  Success (local)")
        } catch  {
            print("Register  Failed (local)")
        }
        
        // Firebase
        Auth.auth().createUser(withEmail: email, password: password) { (user,error) in
            if error != nil {
                print(error!)
            } else {
                print("Registration Successful! (firebase)")
                //self.performSegue(withIdentifier: "goToPlayingMode", sender: self)
            }
        }
    }
    
}
