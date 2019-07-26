//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by Park Jae Han on 23/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        // 피커 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        
        // 피커 띄우기
        self.present(picker, animated: true)
    }
}


// MARK:- 이미지피커컨트롤러 델리게이트 메소드
extension ViewController: UIImagePickerControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // 창닫기: picker.dismiss(animated: true) == picker.presentingViewController?.dismiss(animated: true) == self.dismiss(animated: true)
        picker.dismiss(animated: true) { () in
            
            // 창닫기 후 알림창 호출
            let alert = UIAlertController(title: "", message: "Image Selection Cancel", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true) { () in
            
            // 이미지 뷰에 표시
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage // info는 딕셔너리 타입
            self.imgView.image = img
        }
    }
}

// MARK:- 네비게이션컨트롤러 델리게이트 메소드
extension ViewController: UINavigationControllerDelegate {
    
}
