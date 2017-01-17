

import UIKit
import RealmSwift

class ShowViewCotroller : UIViewController {
    
    @IBOutlet weak var Name: UILabel!
    var taskShow : taskToDoFinal?
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        print(taskShow?.Name ?? "def")
        Name.text = taskShow?.Name
        desc.text = taskShow?.discription
        date.text = taskShow?.date
    }
    
    
    @IBAction func delPresses(_ sender: Any) {
        delete()
        self.dismiss(animated: true, completion: nil);
        performSegue(withIdentifier: "deleted", sender: nil)
        
    }
    
    func delete(){
        let realm = try! Realm()
        try! realm.write {
            realm.delete(taskShow.self!)
        }
    }
}
