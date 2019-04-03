import UIKit
import CoreData
import Firebase

class LoginScreenViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let username : String = usernameTextField.text!
        let password : String = passwordTextField.text!
        
        // login via firebase
        
        Auth.auth().signIn(withEmail: username, password: password) { (user, error) in
            if error != nil {
                print(error!)
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                print("firebase log in succesful!")
                //self.performSegue(withIdentifier: "goToPlayingMode1", sender: self)
            }
        }
        
        
        // login with core data
        
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//        request.returnsObjectsAsFaults = false
//
//        do {
//            let result = try context.fetch(request)
//
//            for data in result as! [NSManagedObject]
//            {
//                let usernameData = data.value(forKey: "username") as? String
//                let passwordData = data.value(forKey: "password") as? String
//
//                if(username == usernameData && password == passwordData)
//                {
//
//                }
//            }
//        } catch  {
//            print("Fetch Login Error")
//        }
        
        // budi hard code :D
//        if(username == "admin" && password == "password")
//        {
//
//        }
//        else
//        {
//            let alert = UIAlertController(title: "Error", message: "Invalid Login Details", preferredStyle: .alert)
//
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//
//            alert.addAction(okAction)
//            present(alert, animated: true, completion: nil)
//        }
        
    }
}
