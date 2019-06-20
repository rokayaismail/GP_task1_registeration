//
//  RegisterationPresenterProtocol.swift
//  Eventhub-Client
//
//  Created by JETS Mobile Lab on 6/19/19.
//  Copyright © 2019 JETS. All rights reserved.
//

import Foundation

protocol RegisterationPresenterProtocol {
    func isValidName(name:String) -> Bool
    func isValidPassword(password:String) -> Bool
    func isValidEmail(email:String) -> Bool
}
