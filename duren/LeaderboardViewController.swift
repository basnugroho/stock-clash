import UIKit

class LeaderboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var user = UserDefaults.standard.object(forKey: "user") as? String
    var networth = UserDefaults.standard.object(forKey: "networth") as? String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (1)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        
        if (UserDefaults.standard.object(forKey: "user") as? String) != nil
        {
            cell.textLabel?.text = "1.   " + " " + user! + " " + networth!
        }
        
        return(cell)
    }
}
