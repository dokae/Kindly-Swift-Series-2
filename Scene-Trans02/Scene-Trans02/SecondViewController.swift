//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by Park Jae Han on 20/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
