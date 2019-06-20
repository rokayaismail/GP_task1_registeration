//
//  LoadingPageViewController.swift
//  Eventhub-Client
//
//  Created by JETS Mobile Lab - 9 on 6/17/19.
//  Copyright © 2019 JETS. All rights reserved.
//

import UIKit

class LoadingPageViewController: UIViewController {

    @IBOutlet weak var img_logo: UIImageView!
    @IBAction func facebookBtn(_ sender: Any) {
    }
    
    
    @IBAction func gmailBtn(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
    circleImg()
    }

    func circleImg()  {
         img_logo.layer.cornerRadius = img_logo.frame.size.width / 2
         img_logo.clipsToBounds = true
    }
   

}
