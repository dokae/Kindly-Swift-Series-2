//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by Park Jae Han on 19/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func moveNext(_ sender: Any) {
        
        // if보다는 guard문이 더 적합
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            
            return
        }

        // 화면전환 애니메이션 타입
        uvc.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        
        // 전환 메소드 호출
        self.present(uvc, animated: true)


//        // 스토리보드 id 참조
//        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") {
//
//        // 화면전환 애니메이션 타입
//        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
//
//        // 전환 메소드 호출
//        self.present(uvc, animated: true)
//        }
    }

//        // 스토리보드 파일 지정 시
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let uvc = storyboard.instantiateViewController(withIdentifier: "SecondVC")


}

