//
//  ViewController.swift
//  sqliteData
//
//  Created by R93 on 31/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var id: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        sqlite.createFile()
    }
    @IBAction func saveButtonAction(_ sender: UIButton)
    {
        if let x = id.text , let y = Int(x) , let p = number.text , let r = Int(p)
        {
            sqlite.addData(id:y, name: name.text!, number: r)
        }
    }
    

    @IBAction func deleteButtonAction(_ sender: UIButton) {
        if let x = id.text , let y = Int(x) , let p = number.text , let r = Int(p)
        {
            sqlite.deletedata (id:y, name: name.text!, number: r)
        }
    }
    
    @IBAction func getDataButtonAction(_ sender: UIButton) {
        let naviget = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(naviget, animated: true)
    }
}

