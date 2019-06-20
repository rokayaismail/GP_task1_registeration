//
//  ViewController.swift
//  EventHub
//
//  Created by Yasmin Ayman on 25/09/1440 AH.
//  Copyright © 1440 yasmin.ayman. All rights reserved.
//

import UIKit
import MaterialComponents

class LoginVC: UIViewController {
    @IBOutlet weak var tf_username: MDCTextField!
    @IBOutlet weak var tf_password: MDCTextField!
    @IBOutlet weak var btn_login: MDCButton!
    
    @IBOutlet weak var btn_showPass_outlet: UIButton!
    
    var tf_username_controller : MDCTextInputControllerUnderline?
    var tf_password_controller : MDCTextInputControllerUnderline?
    
 
    @IBAction func btn_showPass(_ sender: Any) {
        toggleShowPass()
        
    }
    override func viewDidLayoutSubviews() {
        
        tf_password_controller = MDCTextInputControllerUnderline(textInput: tf_password)
        tf_username_controller = MDCTextInputControllerUnderline(textInput: tf_username)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn_showPass_outlet.setImage(UIImage(named: "showPassword"), for: .normal)
        tf_password.setIcon(btn_showPass_outlet, 30)
    }
    
    
    
    //   func roundCoponents(){
    //        tf_password.layer.cornerRadius = tf_password.frame.size.height / 2
    //        tf_password.clipsToBounds = true
    //
    //        tf_username.layer.cornerRadius = tf_username.frame.size.height / 2
    //        tf_username.clipsToBounds = true
    //
    //        btn_login.layer.cornerRadius = btn_login.frame.size.height / 2
    //        btn_login.clipsToBounds = true
    
    //   }
    
    //    func blurBackground() {
    //        let blurEffect = UIBlurEffect(style: .light)
    //        let blurView = UIVisualEffectView(effect: blurEffect)
    //        blurView.frame = imgView_background.bounds
    //        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    //
    //        imgView_background.addSubview(blurView)
    //    }
    
    
}

