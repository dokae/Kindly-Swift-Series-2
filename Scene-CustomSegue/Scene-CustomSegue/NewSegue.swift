//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by Park Jae Han on 21/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit

class NewSegue: UIStoryboardSegue {
    
    override func perform() {
        
        // 세그웨이의 출발지 뷰컨트롤러
        let srcUVC = self.source
        
        // 세그웨이의 목적지 뷰컨트롤러
        let destUVC = self.destination
        
        // fromView에서 toView로 뷰 전환
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown, completion: nil)
    }
}
