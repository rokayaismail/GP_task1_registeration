//
//  AdditionalInfoViewController.swift
//  Eventhub-Client
//
//  Created by JETS Mobile Lab on 6/20/19.
//  Copyright © 2019 JETS. All rights reserved.
//

import UIKit
import MaterialComponents
class AdditionalInfoViewController: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource {
    
    @IBOutlet weak var phoneNumberTF: MDCTextField!
    
    var phoneNumbers = [MDCTextField]()
    
    @IBOutlet weak var jobTitleTF: MDCTextField!
    
    @IBOutlet weak var organizationTF: MDCTextField!
    
    @IBOutlet weak var countryTF: MDCTextField!
    
    @IBOutlet weak var middleNameTF: MDCTextField!
    
    var countryPickerView : UIPickerView?

    var organizationPickerView : UIPickerView?

    var jobTitlePickerView : UIPickerView?
    
    

    var countries = ["czzzzz" , "caaaaa" , "cjkhjkjhkj" , "cwwwww" , "cuuuuuu"]
    var jobs = ["jzzzzz" , "jaaaaa" , "jkhjkjhkj" , "jwwwww" , "juuuuuu"]
    var organizations = ["ozzzzz" , "oaaaaa" , "ojkhjkjhkj" , "owwwww" , "ouuuuuu"]
    @IBAction func addPhoneNumber(_ sender: UIButton) {
        let rect :(CGFloat , CGFloat, CGFloat, CGFloat) = (phoneNumberTF.frame.minX,phoneNumberTF.frame.maxY+40,phoneNumberTF.frame.width,phoneNumberTF.frame.height)
        let sampleTextField =  MDCTextField(frame: CGRect(x: rect.0, y: rect.1 , width: rect.2, height: rect.3))
        var controller = MDCTextInputControllerUnderline(textInput: sampleTextField)
        phoneNumbers.append(sampleTextField)
        sampleTextField.placeholder = "Phone Number"
      self.view.addSubview(sampleTextField)
    }
    
    @IBAction func skip(_ sender: UIButton) {
    }

    var phoneNumberTFCtrl : MDCTextInputControllerUnderline?
    var jobTitleTFCtrl : MDCTextInputControllerUnderline?
    var organizationTFCtrl : MDCTextInputControllerUnderline?
    var countryTFCtrl : MDCTextInputControllerUnderline?
    var middleNameTFCtrl : MDCTextInputControllerUnderline?
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPickerView = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        organizationPickerView = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        jobTitlePickerView = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        phoneNumberTFCtrl = MDCTextInputControllerUnderline(textInput: phoneNumberTF)
        jobTitleTFCtrl = MDCTextInputControllerUnderline(textInput: jobTitleTF)
        organizationTFCtrl = MDCTextInputControllerUnderline(textInput: organizationTF)
        countryTFCtrl = MDCTextInputControllerUnderline(textInput: countryTF)
        middleNameTFCtrl = MDCTextInputControllerUnderline(textInput: middleNameTF)
        // Do any additional setup after loading the view.
        
        phoneNumbers.append(phoneNumberTF)
        countryTF.inputView = countryPickerView
        organizationTF.inputView = organizationPickerView
        jobTitleTF.inputView = jobTitlePickerView
        
        countryPickerView?.delegate = self
        countryPickerView?.dataSource = self
        organizationPickerView?.delegate = self
        organizationPickerView?.dataSource = self
        jobTitlePickerView?.delegate = self
        jobTitlePickerView?.dataSource = self
        let recognizer = UITapGestureRecognizer(target: self, action:#selector(endEdite(_ :)))
        view.addGestureRecognizer(recognizer)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func endEdite(_ : UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(pickerView == countryPickerView){
            return countries.count
        }
        else if(pickerView == jobTitlePickerView){
            return jobs.count
        }
        else if(pickerView == organizationPickerView){
            return organizations.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case countryPickerView:
            countryTF.text = countries[row]
        case jobTitlePickerView:
            jobTitleTF.text = jobs[row]
        case organizationPickerView:
            organizationTF.text = organizations[row]
        default:
            print("error")
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case countryPickerView:
            return countries[row]
        case jobTitlePickerView:
            return jobs[row]
        case organizationPickerView:
            return organizations[row]
        default:
            print("error")
            return "error"
        }
    }
    

}
