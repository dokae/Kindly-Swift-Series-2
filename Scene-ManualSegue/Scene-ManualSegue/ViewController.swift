//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by Park Jae Han on 21/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func wind(_ sender: Any) {
        
        // 세그웨이 실행
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
}

