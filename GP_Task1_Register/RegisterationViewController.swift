//
//  ViewController.swift
//  GP_Task1_Register
//
//  Created by Esraa Hassan on 5/31/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: MDCTextField!
    
    @IBOutlet weak var firstName: MDCTextField!
    
    @IBOutlet weak var lastName: MDCTextField!
    
    @IBOutlet weak var email: MDCTextField!
    
    @IBOutlet weak var password: MDCTextField!
    
    @IBOutlet weak var showHidePasswordBtn: UIButton!
    @IBAction func showHidePassword(_ sender: UIButton) {
        password.isSecureTextEntry = !password.isSecureTextEntry
        if(password.isSecureTextEntry){
            showHidePasswordBtn.setImage(UIImage(named: "baseline_radio_button_checked_black_24dp.png"), for: .normal)
        }
        else{
            showHidePasswordBtn.setImage(UIImage(named: "baseline_radio_button_unchecked_black_24dp.png"), for: .normal)
        }
    }
    @IBOutlet weak var confirmPassword: MDCTextField!
    
    @IBOutlet weak var confirmPassworBtn: UIButton!
    @IBAction func showHideConfirmPassword(_ sender: Any) {
        confirmPassword.isSecureTextEntry = !confirmPassword.isSecureTextEntry
        if(confirmPassword.isSecureTextEntry){
            confirmPassworBtn.setImage(UIImage(named: "baseline_radio_button_checked_black_24dp.png"), for: .normal)
        }
        else{
            confirmPassworBtn.setImage(UIImage(named: "baseline_radio_button_unchecked_black_24dp.png"), for: .normal)
        }
    }
    @IBOutlet weak var signUpBtn: MDCButton!
    var userNameController : MDCTextInputControllerUnderline?
    var firstNameController : MDCTextInputControllerUnderline?
    var lastNameController : MDCTextInputControllerUnderline?
    var emailController : MDCTextInputControllerUnderline?
    var passwordController : MDCTextInputControllerUnderline?
    var confirmPasswordController : MDCTextInputControllerUnderline?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        userNameController = MDCTextInputControllerUnderline(textInput: userName)
        firstNameController = MDCTextInputControllerUnderline(textInput: firstName)
        lastNameController = MDCTextInputControllerUnderline(textInput: lastName)
        emailController = MDCTextInputControllerUnderline(textInput: email)
        passwordController = MDCTextInputControllerUnderline(textInput: password)
        confirmPasswordController = MDCTextInputControllerUnderline(textInput: confirmPassword)
        
        /////////////Delegates///////////////////
        userName.delegate = self
        firstName.delegate = self
        lastName.delegate = self
        email.delegate = self
        password.delegate = self
        confirmPassword.delegate = self
        
        ////////
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
        userImage.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1  ).cgColor
        userImage.layer.borderWidth = 1
//        signUpBtn.clipsToBounds = true
//        let buttonSchema = MDCButtonSchema()
        password.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        var userNameValid = false , firstNameValid = false , lastNameValid = false , emailValid = false , passwordValid = false , confirmPasswordValid = false
        switch textField {
        case userName:
            if(userName.text == ""){
                userNameController?.setErrorText("Empty user name", errorAccessibilityValue: nil)
                userNameValid = false
            }else if(!self.isValidName(name: userName.text!)){
                userNameController?.setErrorText("User name has characters only ,length >= 7 and <= 18", errorAccessibilityValue: nil)
                userNameValid = false
            }else{
                userNameController?.setErrorText(nil, errorAccessibilityValue: nil)
                userNameValid = true;
            }
        case firstName:
            if(firstName.text == ""){
                firstNameController?.setErrorText("Empty name", errorAccessibilityValue: nil)
                firstNameValid = false
            }else if(!self.isValidName(name: firstName.text!)){
                firstNameController?.setErrorText("Name has characters only ,length >= 7 and <= 18", errorAccessibilityValue: nil)
                firstNameValid = false
            }else{
                firstNameController?.setErrorText(nil, errorAccessibilityValue: nil)
                firstNameValid = true;
            }
        case lastName :
            if(lastName.text == ""){
                lastNameController?.setErrorText("Empty name", errorAccessibilityValue: nil)
                lastNameValid = false
            }else if(!self.isValidName(name: lastName.text!)){
                lastNameController?.setErrorText("Name has characters only ,length >= 7 and <= 18", errorAccessibilityValue: nil)
                lastNameValid = false
            }else{
                lastNameController?.setErrorText(nil, errorAccessibilityValue: nil)
                lastNameValid = true;
            }
        case email :
            if(email.text == ""){
                emailController?.setErrorText("Empty Email", errorAccessibilityValue: nil)
                emailValid = false
            }else if(!self.isValidEmail(email: email.text!)){
                emailController?.setErrorText("Email not in valid form", errorAccessibilityValue: nil)
                emailValid = false
            }else{
                emailController?.setErrorText(nil, errorAccessibilityValue: nil)
                emailValid = true;
            }
        case password :
            if(password.text!.count < 8){
                passwordController?.setErrorText("Password length must be at least 8", errorAccessibilityValue: nil)
                passwordValid = false
            }else if(!self.isValidPassword(password: password.text!)){
                passwordController?.setErrorText("Password has characters ,sympols and numbers", errorAccessibilityValue: nil)
                passwordValid = false
            }else{
                passwordController?.setErrorText(nil, errorAccessibilityValue: nil)
                passwordValid = true;
            }
        case confirmPassword :
            confirmPasswordValid = (password.text == confirmPassword.text)
            if(confirmPasswordValid){
                confirmPasswordController?.setErrorText(nil, errorAccessibilityValue: nil)
            }else{
                confirmPasswordController?.setErrorText("", errorAccessibilityValue: nil)
            }
        default:
            print("error")
        }
//        if(userNameValid && firstNameValid && lastNameValid && emailValid && passwordValid && confirmPasswordValid){
//            signUpBtn.setEnabled(true, animated: true)}
//        else{
//            signUpBtn.setEnabled(false, animated: true)}

    }
    func isValidName(name:String) -> Bool {
        let regexExp = "\\w{7,18}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexExp)
        return predicate.evaluate(with: name)
    }
    func isValidPassword(password:String) -> Bool {
        let regexExp = "123456789"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexExp)
        return predicate.evaluate(with: password)
    }
    func isValidEmail(email:String) -> Bool {
        let regexExp = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
        "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
        "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
        "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
        "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
        "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexExp)
        return predicate.evaluate(with: email)
    }
}

