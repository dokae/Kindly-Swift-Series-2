//
//  ViewController.swift
//  Scene-CustomSegue
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "custom_segue") {
            NSLog("segueway identifier: \(segue.identifier!), 커스텀세그")
        } else if (segue.identifier == "action_segue") {
            NSLog("segueway identifier: \(segue.identifier!), 액션세그")
        } else {
            NSLog("error")
        }
       
    }
}
