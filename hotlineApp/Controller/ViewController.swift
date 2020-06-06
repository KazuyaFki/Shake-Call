//
//  ViewController.swift
//  telephoneApp1
//
//  Created by Kazuya Fukui on 2020/05/06.
//  Copyright © 2020 Kazuya Fukui. All rights reserved.
//

import UIKit
import GoogleMobileAds
import MessageUI
import Lottie


class ViewController: UIViewController {
    
    
    
    var telNumber = String()
    var name = String()
    
    var nameString = String()
    var numberString = String()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "sky")
        imageView.contentMode = .scaleAspectFill
        
        //ca-app-pub-3940256099942544/2934735716
        bannerView.adUnitID = "ca-app-pub-3236472241976929/7272909925"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        startAnimation(view: view)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "textNumber") != nil {
            telNumber = UserDefaults.standard.object(forKey: "textNumber") as! String
        }
        
        navigationController?.isNavigationBarHidden = false
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2232067585, green: 0.714556694, blue: 1, alpha: 1)
        
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        
        if UserDefaults.standard.object(forKey: "name") != nil {
            
            name = (UserDefaults.standard.object(forKey: "name") as! String)
            nameLabel.text = "\(name)"
        }
        
        startAnimation(view: view)
    }
    
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if let callUrl = URL(string: "tel://\(telNumber)"), UIApplication.shared.canOpenURL(callUrl) {
            UIApplication.shared.open(callUrl)
        }
    }
    
    
    
    @IBAction func phoneTap(_ sender: Any) {
        
        if let callUrl = URL(string: "tel://\(telNumber)"), UIApplication.shared.canOpenURL(callUrl) {
            UIApplication.shared.open(callUrl)
        }
        
    }
    
    
}


