//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by Park Jae Han on 22/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.tf.placeholder = "Input Text"
        self.tf.keyboardType = UIKeyboardType.alphabet
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark
        self.tf.returnKeyType = UIReturnKeyType.join
        self.tf.enablesReturnKeyAutomatically = true
        self.tf.clearsOnBeginEditing = true
        
        self.tf.borderStyle = UITextField.BorderStyle.line
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0)
        self.tf.contentVerticalAlignment = .center
        self.tf.contentHorizontalAlignment = .center
        self.tf.layer.borderColor = UIColor.darkGray.cgColor
        self.tf.layer.borderWidth = 2.0
        
        self.tf.becomeFirstResponder()
        self.tf.delegate = self
    }

    @IBAction func confirm(_ sender: Any) {        
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        self.tf.becomeFirstResponder()
    }
    
    // 델리게이트 메소드
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("편집 시작")
        return true // false는 편집하지 않음
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("필드 내용 삭제")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("내용이 \(string)으로 변경")
        
        if Int(string) == nil { // 숫자를 입력할 수 없도록
            
            if (textField.text?.count)! + string.count > 10 { // 입력된 길이와 입력한 문자열의 길이합이 10이 넘는다면 반영X
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("리턴키 눌림")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("편집 종료 중")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("편집 종료")
    }
    
    
    
    
}

