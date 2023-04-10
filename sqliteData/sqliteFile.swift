//
//  sqliteFile.swift
//  sqliteData
//
//  Created by R93 on 31/03/23.
//

import Foundation
import SQLite3
 struct Model
{
     var id: Int
     var name: String
     var mobileNumber: Int
 }
class sqlite
{
    static var file : OpaquePointer?
    static func createFile()
    {
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("SqliteFile.db")
        sqlite3_open(a.path, &file)
        print(a.path)
        print("Create File")
        createtable()
    }
    static func createtable()
    {
        let query = "Create Table if not exists Student (id integer,name text,number integer)"
        var table : OpaquePointer?
        sqlite3_prepare(file, query, -1, &table, nil)
        print("Create Table")
        sqlite3_step(table)
    }
    static func addData(id:Int,name:String,number:Int)
    {
        let query = "insert into Student values (\(id),'\(name)' ,\(number) )"
        var data : OpaquePointer?
        sqlite3_prepare(file, query, -1, &data, nil)
        print("Add Data ")
        sqlite3_step(data)
    }
    static func getData()->[Model]
    {
        var array = [Model]()
        let query = "select id,name,number from Student"
        var get : OpaquePointer?
        sqlite3_prepare(file, query, -1, &get, nil)
     while sqlite3_step(get) == SQLITE_ROW
        {
            let id = sqlite3_column_int64(get, 0)
            print("id = \(id);",terminator: "")
            let mobileNumber = sqlite3_column_int64(get, 2)
            print("number = \(mobileNumber);",terminator: "")
            if let cString = sqlite3_column_text(get, 1)
            {
                let name = String(cString: cString)
                array.append(Model(id: Int(id), name: name, mobileNumber: Int(mobileNumber)))
            }
        }
        print("get Data")
        return array
    }
    static func deletedata(id:Int,name:String,number:Int)
    {
        let query = "DELETE FROM Student WHERE id = \(id)"
        var delete : OpaquePointer?
        sqlite3_prepare(file, query, -1, &delete, nil)
        print("Add Delete ")
        sqlite3_step(delete)
        
    }
}

