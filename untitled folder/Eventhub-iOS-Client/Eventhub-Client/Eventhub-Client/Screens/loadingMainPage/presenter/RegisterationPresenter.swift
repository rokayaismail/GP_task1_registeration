//
//  RegisterationPresenter.swift
//  Eventhub-Client
//
//  Created by JETS Mobile Lab on 6/19/19.
//  Copyright © 2019 JETS. All rights reserved.
//

import Foundation

class RegisterationPresenter : RegisterationPresenterProtocol{
    func isValidName(name:String) -> Bool {
        let regexExp = "(?:[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]{5,26}))"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regexExp)
        return predicate.evaluate(with: name)
    }
    func isValidPassword(password:String) -> Bool {
        let regexExp = "(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
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
    }}
