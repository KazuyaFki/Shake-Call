//
//  MainTabBarController.swift
//  hotlineApp
//
//  Created by Kazuya Fukui on 2020/05/22.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       UITabBar.appearance().tintColor = #colorLiteral(red: 0.9960995317, green: 1, blue: 0, alpha: 1)
        
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.2232067585, green: 0.714556694, blue: 1, alpha: 1)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
