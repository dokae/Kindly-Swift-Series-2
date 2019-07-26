//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by Park Jae Han on 24/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var list = [String]()
    
    
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "List Input", message: "Add Message", preferredStyle: .alert)
        alert.addTextField(){ (tf) in
            tf.placeholder = "Add Message"
        }
        
        let ok = UIAlertAction(title: "OK", style: .default){ (_) in
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    /* // 개별행 수동 제어
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let row = self.list[indexPath.row]
        let height = CGFloat(60 + (row.count / 30) * 20)
        return height
    } */
}
