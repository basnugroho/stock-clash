//
//  PlayingModeViewController.swift
//  duren
//
//  Created by Baskoro Nugroho on 03/04/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//

import UIKit
import Firebase

class PlayingModeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let playingModesArray = ["Live Mode", "Arcade Mode"]
    var choosenPlayingMode = ""
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var playingModePicker: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return playingModesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return playingModesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choosenPlayingMode = playingModesArray[row]
        print("playing mode: \(choosenPlayingMode)")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        playingModePicker.delegate = self
        playingModePicker.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
    }
    
    func moveToPage(playingMode: String) {
        if playingMode == "Live Mode" {
            print("move to: \(playingMode)")
            performSegue(withIdentifier: "goToProfile", sender: self)
        } else if playingMode == "Aracade Mode" {
            print("move to: \(playingMode)")
            performSegue(withIdentifier: "goToProfile", sender: self)
        } else {
            print("no picker choosen")
        }
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
