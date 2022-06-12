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
        
        db.insert(id: 1, name: "Bilal", age: 24)
              db.insert(id: 2, name: "Bosh", age: 25)
              db.insert(id: 3, name: "Thor", age: 23)
              db.insert(id: 4, name: "Edward", age: 44)
              db.insert(id: 5, name: "Ronaldo", age: 34)
              
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
    
    
    


}

