//
//  LoginExtention.swift
//  EventHub
//
//  Created by Yasmin Ayman on 16/10/1440 AH.
//  Copyright © 1440 yasmin.ayman. All rights reserved.
//

import Foundation
import MaterialComponents
extension LoginVC
{
    func designUIComponents() {
//        img_logo.layer.cornerRadius = img_logo.frame.size.width / 2
//        img_logo.clipsToBounds = true
        
        btn_login.layer.cornerRadius = 15
        btn_login.clipsToBounds = true
        
        tf_password_controller = MDCTextInputControllerUnderline(textInput: tf_password)
        tf_username_controller = MDCTextInputControllerUnderline(textInput: tf_username)
        
        tf_password.isSecureTextEntry = true
        btn_showPass_outlet.setImage(UIImage(named: "showPassword"), for: .normal)
    }
    
    func toggleShowPass() {
                if(!tf_password.isSecureTextEntry){
                    btn_showPass_outlet.setImage(UIImage(named: "hidePassword"), for: .normal)
                }
                else{
                    btn_showPass_outlet.setImage(UIImage(named: "showPassword"), for: .normal)
                }
        tf_password.isSecureTextEntry = !tf_password.isSecureTextEntry
    }
}
