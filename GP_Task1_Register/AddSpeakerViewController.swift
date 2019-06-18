//
//  AddSpeakerViewController.swift
//  GP_Task1_Register
//
//  Created by Rokaya on 6/16/19.
//  Copyright © 2019 iti. All rights reserved.
//

import UIKit
import MaterialComponents

class AddSpeakerViewController: UIViewController , UITextViewDelegate {


    @IBOutlet weak var speakerImage: UIImageView!
    @IBOutlet weak var nameTextField: MDCTextField!
    @IBOutlet weak var organizationTextField: MDCTextField!
    @IBOutlet weak var jobTitelTextField: MDCTextField!
    @IBOutlet weak var bioTextField: MDCMultilineTextField!
    
    
    @IBOutlet weak var addSpeakerBtnOutlet: MDCButton!
    @IBAction func addSpeakerBtn(_ sender: MDCButton) {
    }
    
    var nameTextFieldCtrl : MDCTextInputControllerUnderline?
    var organizationTextFieldCtrl : MDCTextInputControllerUnderline?
    var jobTitelTextFieldCtrl : MDCTextInputControllerUnderline?
    var bioTextFieldCtrl : MDCTextInputControllerUnderline?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bioTextField.placeholder = "Write Bio"
        nameTextFieldCtrl = MDCTextInputControllerUnderline(textInput: nameTextField)
        organizationTextFieldCtrl = MDCTextInputControllerUnderline(textInput: organizationTextField)
        jobTitelTextFieldCtrl = MDCTextInputControllerUnderline(textInput: jobTitelTextField)
        bioTextFieldCtrl = MDCTextInputControllerUnderline(textInput: bioTextField)
        
        //////////Delegates///////////////
        bioTextField.textView?.delegate = self
        //Image styling
        speakerImage.layer.cornerRadius = speakerImage.frame.size.width / 2
        speakerImage.clipsToBounds = true
        speakerImage.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1  ).cgColor
        speakerImage.layer.borderWidth = 1
        
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
