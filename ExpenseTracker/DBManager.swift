
//
//  DBManager.swift
//  FMDBTut
//
//  Created by Gabriel Theodoropoulos on 07/10/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

import UIKit

@objc class DBManager: NSObject {

   @objc static let shared: DBManager = DBManager()
    
    let databaseFileName = "ExpenseTracker"
    
    var pathToDatabase: String!
    
    var database: FMDatabase!


    override init() {
        super.init()
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName).sqlite")
        print("Doc Dir path ---- \(documentsDirectory)")
        if !FileManager.default.fileExists(atPath: pathToDatabase){
            let bundlePath = Bundle.main.path(forResource: databaseFileName, ofType: "sqlite")
            if bundlePath != nil {
                do{
                    try FileManager.default.copyItem(atPath: bundlePath!, toPath: pathToDatabase)
                }catch{
                    print("\n error to copy database")
                    print(error)
                }
            }
        }
    }
    
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
                print("Path to database : \(pathToDatabase!)")
            }
        }
        
        if database != nil {
            if database.open() {
                return true
            }
        }
        
        return false
    }
    
    func insertMediaProgress(_ title : String,_ amount : Double,_ date : Date,_ category : String,_ note : String ) {
        do {
            let query = "insert into MediaPlayProgress (title,amount,date,category,note) values ('\(title)', '\(amount)', '\(date.timeIntervalSince1970)', '\(category)', '\(note)');"
            if openDatabase() {
                if !database.executeStatements(query) {
                    print("Failed to insert initial data into the database. insertBranchDataToDatabase")
                    print(database.lastError(), database.lastErrorMessage())
                }
                database.close()
            }
        }
    }
    
}

