//
//  ViewController.swift
//  GP_Task1_Register
//
//  Created by Esraa Hassan on 5/31/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents
class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userName: MDCTextField!
    
    @IBOutlet weak var firstName: MDCTextField!
    
    @IBOutlet weak var lastName: MDCTextField!
    
    @IBOutlet weak var email: MDCTextField!
    
    @IBOutlet weak var password: MDCTextField!
    
    @IBOutlet weak var confirmPassword: MDCTextField!
    
    @IBOutlet weak var signUpBtn: MDCButton!
    var userNameController : MDCTextInputControllerOutlined?
    var firstNameController : MDCTextInputControllerOutlined?
    var lastNameController : MDCTextInputControllerOutlined?
    var emailController : MDCTextInputControllerOutlined?
    var passwordController : MDCTextInputControllerOutlined?
    var confirmPasswordController : MDCTextInputControllerOutlined?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userNameController = MDCTextInputControllerOutlined(textInput: userName)
        firstNameController = MDCTextInputControllerOutlined(textInput: firstName)
        lastNameController = MDCTextInputControllerOutlined(textInput: lastName)
        emailController = MDCTextInputControllerOutlined(textInput: email)
        passwordController = MDCTextInputControllerOutlined(textInput: password)
        confirmPasswordController = MDCTextInputControllerOutlined(textInput: confirmPassword)
        userName.delegate = self
//        let buttonSchema = MDCButtonSchema()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = userName.text,
            text == "roka" ,
            textField == userName
            else{
                return true
        }
        userNameController!.setErrorText("Not valid", errorAccessibilityValue: nil)
        return true
    }


}

