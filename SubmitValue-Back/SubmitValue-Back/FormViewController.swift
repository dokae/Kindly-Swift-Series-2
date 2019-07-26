//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by Park Jae Han on 22/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    

    @IBAction func onSwitch(_ sender: UISwitch) {
        
        if sender.isOn == true {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신안함"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        
        let value = sender.value
        self.intervalText.text = "\(Int(value))"
    }
    

    @IBAction func onSubmit(_ sender: Any) {
        
        /* 동기식 값 저장
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {
            return
        }
        
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        */
        
        /* AppDelegate를 이용한 값 저장
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value
        */
        
        // NSUserDefault를 이용한 값 저장
        let ud = UserDefaults.standard
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
                
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
