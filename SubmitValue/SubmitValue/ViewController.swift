//
//  ViewController.swift
//  SubmitValue
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
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    @IBOutlet weak var isUpdateText: UILabel!
    @IBOutlet weak var intervalText: UILabel!
    
    
    // 스위치 눌렀을때 호출
    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    // 스텝퍼 눌렀을때 호출
    @IBAction func onStepper(_ sender: UIStepper) {
  
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        // RVC인스턴스 생성 & 프로퍼티 사용을 위해 RVC타입으로 다운캐스팅 & 옵셔널캐스팅 처리로 옵셔널바인딩
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            return
        }
        
        // 값 저장
        if let emailText = self.email.text {
            rvc.paramEmail = emailText
            NSLog("이메일 값 저장")

        } else {
            NSLog("이메일 값 없음")
        }
        
        // rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        // 화면 이동
        // self.present(rvc, animated: true, completion: nil) // 예제1
        self.navigationController?.pushViewController(rvc, animated: true)
        
    }
    
    // Manual Segue
    @IBAction func onPerformSegue(_ sender: Any) {
        
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
    
    
}

