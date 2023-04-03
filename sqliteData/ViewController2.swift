//
//  ViewController2.swift
//  sqliteData
//
//  Created by R93 on 03/04/23.
//

import UIKit

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tablerView: UITableView!
    var arr = sqlite.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.idlabel.text = arr[indexPath.row].id.description
        cell.nameLabel.text = arr[indexPath.row].name
        cell.numberLabel.text = arr[indexPath.row].mobileNumber.description
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

}
