
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var bill = "0.0"
    var person = 2
    var tip = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = bill
        settingsLabel.text = "Split between \(person) people, with \(tip)% tip"
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
