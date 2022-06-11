//
//  Person.swift
//  testUD
//
//  Created by Conner Montgomery on 5/25/22.
//

import Foundation

// Creates a class called Person
// person contains: Name, Age, ID
// default constructor (initializer)

class Person {
    var name: String = ""
    var age: Int = 0
    var id: Int = 0
    
    init(id:Int, name:String, age:Int){
        self.name = name
        self.age = age
        self.id  = id
        
    }
    
    
    
}
