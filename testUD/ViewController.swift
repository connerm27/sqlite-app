//
//  ViewController.swift
//  testUD
//
//  Created by Conner Montgomery on 5/22/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    


    
    @IBOutlet weak var tableView: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    var db:DBHelper = DBHelper()
    
    var persons:[Person] = []
    
    
    

    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    
    @IBOutlet weak var submitForm: UIButton!
    
    @IBAction func submitFormAction(_ sender: Any) {
        
        let appendName:String = nameField.text ?? "N/A"
        let appendAge = ageField.text ?? "0"
        
        
        let PersonInstance = Person(name:appendName, age:Int(appendAge) ?? 0, id: 0)
        submitFormNow(p:PersonInstance)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        // UserDefaults in ViewDidLoad function
        
        // Create a new instance of UserDefaults
        let defaults = UserDefaults.standard
        
        //Writing data to UserDefaults
        
        
        
        // Create key-value pairs for storage
        defaults.set(25, forKey: "Age")
        defaults.set(true, forKey: "UseTouchID")
        defaults.set(CGFloat.pi, forKey:"Pi")
        // More complex data type -> array
        let array = ["Hello", "World"]
        defaults.set(array, forKey: "SavedArray")
        
        
        let array2 = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()

        label.text = array2[0]
        
    */
        
    
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        /*
        db.insert(name: "Conner", age: 24)
              db.insert(name: "Conner", age: 25)
              db.insert(name: "Conner", age: 23)
              db.insert(name: "Conner", age: 44)
              db.insert(name: "Conner", age: 34)
              */
              persons = db.read()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return persons.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.textLabel?.text = "Name: " + persons[indexPath.row].name + ", " + "Age: " + String(persons[indexPath.row].age)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        db.deleteById(id: persons[indexPath.row].id)
        persons.remove(at:indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.reloadData()
        
        
        
    
    }
    
    func submitFormNow(p:Person) {
        
        
        db.insert(name: p.name, age: p.age)
        persons = db.read()
        tableView.reloadData()
        
        
        
    }
    


}

