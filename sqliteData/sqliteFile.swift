//
//  sqliteFile.swift
//  sqliteData
//
//  Created by R93 on 31/03/23.
//

import Foundation
import SQLite3

class sqlite
{
    static var file : OpaquePointer?

    static func createFile()
    {
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("Sqlite File.db")
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
    static func getData()
    {
        
    }
    static func deletedata()
    {
        
    }
}

