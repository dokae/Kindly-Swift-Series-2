//
//  ViewController.swift
//  HelloWorld
//
//  Created by Park Jae Han on 19/07/2019.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet var uiTitle: UILabel!
    
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello World!"
    }
}

