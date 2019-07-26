//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by Park Jae Han on 21/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    // 화면에 값 표시용
    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    
    // 값 전달을 위한 변수
    var paramEmail: String = ""
    var paramUpdate: Bool = false
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분마다 갱신"
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
