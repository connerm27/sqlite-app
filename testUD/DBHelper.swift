//
//  DBHelper.swift
//  testUD
//
//  Created by Conner Montgomery on 5/25/22.
//

import Foundation
import SQLite3

class DBHelper {
    
    // initialize
    init() {
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?
    
    func openDatabase() -> OpaquePointer? {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in:.userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        
        var db:OpaquePointer? = nil
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
            return nil
            
        } else {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
        
        
        
    }
    
    
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS person(Id INTEGER PRIMARY KEY, name TEXT, age INTEGER);"
        
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("person table created.")
            } else {
                print("person table could not be created")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
        
        
    }
    
    
    // insert function
    func insert(id:Int, name:String, age:Int) {
        let persons = read()
        for p in persons {
            if p.id == id {
                return
            }
        }
        
    }
    
    
    
    
    
    
}