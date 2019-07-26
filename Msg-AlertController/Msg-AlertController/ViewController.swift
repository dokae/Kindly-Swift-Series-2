//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by Park Jae Han on 22/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var result: UILabel!
    
    @IBAction func alert(_ sender: Any) {
        
        let alert = UIAlertController(title: "Select", message: "Select Button", preferredStyle: .alert)
        //let alert = UIAlertController(title: "Select", message: "Select Button", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){ (_) in // 트레일링
            self.result.text = "Cancel Button Touched" }
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.result.text = "OK Button Touched" })
        let exec = UIAlertAction(title: "Run", style: .destructive){ (_) in
            self.result.text = "Run Button Touched" }
        let stop = UIAlertAction(title: "Stop", style: .default){ (_) in
            self.result.text = "Stop Button Touched" }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        let title = "iTunes Store login"
        let message = "Input your account password"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        let ok = UIAlertAction(title: "OK", style: .default){ (_) in
            if let tf = alert.textFields?[0] {
                print("input is \(tf.text!)")
            } else {
                print("no input")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "Password"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: true)
        }

    
    @IBAction func auth(_ sender: Any) {
        
        let msg = "Login"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        let ok = UIAlertAction(title: "OK", style: .default){ (_) in

            let loginID = alert.textFields?[0].text
            let loginPW = alert.textFields?[1].text
            
            if loginID == "dokae" && loginPW == "1234" {
                self.result.text = "Login Successed"
            } else {
                self.result.text = "Login Failed"
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "ID"
            tf.isSecureTextEntry = false
        })
        
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "Password"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: true)
        
    }
    
    
    
}

