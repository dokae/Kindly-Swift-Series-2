//
//  ViewController.swift
//  IBTest
//
//  Created by Park Jae Han on 19/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!
    
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "clicked"
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "clicked"
    }
    
    @IBAction func clickBtn03(_ sender: Any) {
        self.uiTitle03.text = "clicked"
    }
    
    @IBAction func clickBtn04(_ sender: Any) {
        self.uiTitle04.text = "clicked"
    }

    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "clicked"
    }
    



















}

