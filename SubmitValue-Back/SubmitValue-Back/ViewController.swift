//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by Park Jae Han on 22/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    /* 동기식 값 저장 예제
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    */
    
    override func viewWillAppear(_ animated: Bool) {
        
        /* 동기식 값 저장
        if let email = paramEmail {
            resultEmail.text = email
        }
        
        if let update = paramUpdate {
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        } */
        
        
        /* AppDelegate를 이용한 값 저장
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let email = ad?.paramEmail {
            resultEmail.text = email
        }
        
        if let update = ad?.paramUpdate {
            resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        }
        
        if let interval = ad?.paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        } */
        
        
        // NSUserDefault를 이용한 값 저장
        let ud = UserDefaults.standard
        
        if let email = ud.string(forKey: "email") { //NSUserDefault는 String타입의 메소드만 반환값이 옵셔널
            resultEmail.text = email
        }
        
        let update = ud.bool(forKey: "isUpdate")
        resultUpdate.text = (update == true ? "자동갱신" : "자동갱신안함")
        
        let interval = ud.double(forKey: "interval")
        resultInterval.text = "\(Int(interval))분마다"
        
    }
    
    
}

