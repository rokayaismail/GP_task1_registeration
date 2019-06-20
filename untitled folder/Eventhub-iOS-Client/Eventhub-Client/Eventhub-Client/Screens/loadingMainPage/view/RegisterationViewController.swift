//
//  RegisterationViewController.swift
//  Eventhub-Client
//
//  Created by JETS Mobile Lab - 9 on 6/17/19.
//  Copyright © 2019 JETS. All rights reserved.
//

import UIKit
import MaterialComponents
class RegisterationViewController: UIViewController
{
    var registerationPresenter : RegisterationPresenterProtocol?
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: MDCTextField!
    
    @IBOutlet weak var firstName: MDCTextField!
    
    @IBOutlet weak var lastName: MDCTextField!
    
    @IBOutlet weak var email: MDCTextField!
    
    @IBOutlet weak var password: MDCTextField!
    @IBOutlet weak var showHidePasswordBtn: UIButton!
    @IBAction func showHidePassword(_ sender: Any) {
        password.isSecureTextEntry = !password.isSecureTextEntry
        if(!password.isSecureTextEntry){
            showHidePasswordBtn.setImage(UIImage(named: "hidePassword"), for: .normal)
        }
        else{
            showHidePasswordBtn.setImage(UIImage(named: "showPassword"), for: .normal)
        }
    }
    @IBOutlet weak var confirmPassword: MDCTextField!
    @IBOutlet weak var confirmPassworBtn: UIButton!
    @IBAction func showHideConfirmPassword(_ sender: Any) {
        confirmPassword.isSecureTextEntry = !confirmPassword.isSecureTextEntry
        if(!confirmPassword.isSecureTextEntry){
            confirmPassworBtn.setImage(UIImage(named: "hidePassword"), for: .normal)
        }
        else{
            confirmPassworBtn.setImage(UIImage(named: "showPassword"), for: .normal)
        }
    }
    
    
    @IBOutlet weak var datePicker: MDCTextField!
   
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var signUpBtn: MDCButton!
    var userNameController : MDCTextInputControllerUnderline?
    var firstNameController : MDCTextInputControllerUnderline?
    var lastNameController : MDCTextInputControllerUnderline?
    var emailController : MDCTextInputControllerUnderline?
    var passwordController : MDCTextInputControllerUnderline?
    var confirmPasswordController : MDCTextInputControllerUnderline?
    var dateOfBirthController : MDCTextInputControllerUnderline?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerationPresenter = RegisterationPresenter()
        // Do any additional setup after loading the view, typically from a nib.
        userNameController = MDCTextInputControllerUnderline(textInput: userName)
        firstNameController = MDCTextInputControllerUnderline(textInput: firstName)
        lastNameController = MDCTextInputControllerUnderline(textInput: lastName)
        emailController = MDCTextInputControllerUnderline(textInput: email)
        passwordController = MDCTextInputControllerUnderline(textInput: password)
        confirmPasswordController = MDCTextInputControllerUnderline(textInput: confirmPassword)
        dateOfBirthController = MDCTextInputControllerUnderline(textInput: datePicker)
        signUpBtn.applyContainedTheme(withScheme: MDCContainerScheme())
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
        let c : UIColor = .blue
        userImage.layer.borderColor = c.cgColor
        userImage.layer.borderWidth = 1
        //        signUpBtn.clipsToBounds = true
        //        let buttonSchema = MDCButtonSchema()
        password.isSecureTextEntry = true
        confirmPassword.isSecureTextEntry = true
        ////////////////////////icons////////////////////
        userName.setIcon(UIImageView(image: UIImage(named: "account")), 30)
        lastName.setIcon(UIImageView(image: UIImage(named: "account")), 30)
        firstName.setIcon(UIImageView(image: UIImage(named: "account")), 30)
        email.setIcon(UIImageView(image: UIImage(named: "email")), 30)
        datePicker.setIcon(UIImageView(image: UIImage(named: "date")), 30)
        password.setIcon(showHidePasswordBtn , 30)
        confirmPassword.setIcon(confirmPassworBtn, 30)
        /////////////////////////////DatePicker////////////////
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePicker.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender :)) , for: .valueChanged)
        
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(endEdite(_ :)))
        view.addGestureRecognizer(recognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension RegisterationViewController : UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        var userNameValid = false , firstNameValid = false , lastNameValid = false , emailValid = false , passwordValid = false , confirmPasswordValid = false
        switch textField {
        case userName:
            if(userName.text == ""){
                userNameController?.setErrorText("Empty user name", errorAccessibilityValue: nil)
                userNameValid = false
            }else if(!registerationPresenter!.isValidName(name: userName.text!)){
                userNameController?.setErrorText("User name has characters only ,length >= 5 and <= 26", errorAccessibilityValue: nil)
                userNameValid = false
            }else{
                userNameController?.setErrorText(nil, errorAccessibilityValue: nil)
                userNameValid = true;
            }
        case firstName:
            if(firstName.text == ""){
                firstNameController?.setErrorText("Empty name", errorAccessibilityValue: nil)
                firstNameValid = false
            }else if(!registerationPresenter!.isValidName(name: firstName.text!)){
                firstNameController?.setErrorText("Name has characters only ,length >= 5 and <= 26", errorAccessibilityValue: nil)
                firstNameValid = false
            }else{
                firstNameController?.setErrorText(nil, errorAccessibilityValue: nil)
                firstNameValid = true;
            }
        case lastName :
            if(lastName.text == ""){
                lastNameController?.setErrorText("Empty name", errorAccessibilityValue: nil)
                lastNameValid = false
            }else if(!registerationPresenter!.isValidName(name: lastName.text!)){
                lastNameController?.setErrorText("Name has characters only ,length >= 5 and <= 26", errorAccessibilityValue: nil)
                lastNameValid = false
            }else{
                lastNameController?.setErrorText(nil, errorAccessibilityValue: nil)
                lastNameValid = true;
            }
        case email :
            if(email.text == ""){
                emailController?.setErrorText("Empty Email", errorAccessibilityValue: nil)
                emailValid = false
            }else if(!registerationPresenter!.isValidEmail(email: email.text!)){
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
            }else if(!registerationPresenter!.isValidPassword(password: password.text!)){
                passwordController?.setErrorText("Must have Uppercase, Lowercase, Number and Special Character", errorAccessibilityValue: nil)
                passwordValid = false
            }else{
                passwordController?.setErrorText(nil, errorAccessibilityValue: nil)
                passwordValid = true;
            }
        case confirmPassword :
            if((password.text == confirmPassword.text)){
                confirmPasswordController?.setErrorText(nil, errorAccessibilityValue: nil)
                confirmPasswordValid = true
                
            }else{
                confirmPasswordController?.setErrorText("", errorAccessibilityValue: nil)
                confirmPasswordValid = false
            }
        default:
            print("error")
        }
        //                if(userNameValid && firstNameValid && lastNameValid && emailValid && passwordValid && confirmPasswordValid){
        //                    signUpBtn.setEnabled(true, animated: true)}
        //                else{
        //                    signUpBtn.setEnabled(false, animated: true)}
        
    }
    @objc func handleDatePicker(sender : UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        datePicker.text = dateFormatter.string(from: sender.date)
        
    }
    @objc func endEdite(_ : UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
extension UITextField {
    func setIcon(_ image: UIView, _ size: Int) {
        let iconContainerView: UIView = UIView(frame:
            CGRect(x: 0, y: 0, width: size + 8, height: size))
        iconContainerView.addSubview(image)
        leftViewMode = .always
        leftView = iconContainerView
    }
}
