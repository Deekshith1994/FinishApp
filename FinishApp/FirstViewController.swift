

import UIKit
import RealmSwift
class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    //@IBOutlet weak var searchText: UITextField!
    var tasks: Array<taskToDoFinal> = Array();
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        //return 1
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"Cell")
       
        cell.textLabel?.text = tasks[indexPath.row].Name
        //cell.textLabel?.text = "Hello"
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tasks[indexPath.row]);
        print(indexPath.row)
        performSegue(withIdentifier: "showTask", sender: tasks[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! ShowViewCotroller
        guest.taskShow = sender as? taskToDoFinal
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        query()
        table.reloadData()
        
        
    }
    
    func query() {
        tasks.removeAll()
        let realm = try! Realm()
        let relmTasks = realm.objects(taskToDoFinal.self)
        
        for taskToDo in relmTasks{
            tasks.append(taskToDo)
            print(taskToDo.Name)
        }
        
        tasks = tasks.sorted(by: { $0.date.compare($1.date) == ComparisonResult.orderedAscending })
        
        
    }
    
    func returnDate( date:String) -> Date{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy";
        let date1 = dateFormatter.date(from: date )
        
        return date1!
        
    }
}


