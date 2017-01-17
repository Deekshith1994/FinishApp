

import UIKit
import RealmSwift

class SecondViewController: UIViewController {

    var date = "N/A"
    @IBAction func dateChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        date = dateFormatter.string(from: datepicker.date)

    }
    
    @IBOutlet weak var taskDesc: UITextField!
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func addPressed(_ sender: Any) {
        let realm = try! Realm()
        let task = taskToDoFinal()
        
        task.Name = taskName.text!
        task.discription = taskDesc.text!
        task.date = date
    
        try! realm.write {
            realm.add(task)
        }
        taskDesc.text = ""
        taskName.text = ""
        performSegue(withIdentifier: "added", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datepicker.datePickerMode = .date
        
        datepicker.addTarget(self, action: #selector(SecondViewController.dateChanged(_:)), for: .valueChanged)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        date = dateFormatter.string(from: datepicker.date)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dateChaged(datepicker1 : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        date = dateFormatter.string(from: datepicker1.date)
    }
    
}
