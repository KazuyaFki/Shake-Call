//
//  Animation.swift
//  hotlineApp
//
//  Created by Kazuya Fukui on 2020/05/10.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import Foundation
import Lottie

let animationView = AnimationView()

//メソッドにどこにアニメーションを貼り付けるか引数を入れる
func startAnimation(view:UIView) {
    let animation = Animation.named("shake")
    
    animationView.frame = CGRect(x: 0, y: 100, width:  view.frame.size.width, height: view.frame.size.height/2)
    
    animationView.animation = animation
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = .loop
    animationView.play()
    view.addSubview(animationView)
    
}

func stopAnimation() {
    
    animationView.removeFromSuperview()
    
}

