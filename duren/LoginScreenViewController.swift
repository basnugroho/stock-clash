import UIKit

class LoginScreenViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
=======

>>>>>>> parent of 84ef98d... Merge branch 'master' of https://github.com/basnugroho/stock-clash
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let username : String = usernameTextField.text!
        let password : String = passwordTextField.text!
        
        
        if(username.isEmpty || password.isEmpty)
        {
            
        }
        
        if(username == "admin" && password == "password")
        {
            
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Invalid Login Details", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
}
