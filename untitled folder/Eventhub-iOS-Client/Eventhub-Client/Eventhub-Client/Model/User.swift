//
//  User.swift
//  Eventhub-Client
//
//  Created by JETS Mobile Lab on 6/19/19.
//  Copyright © 2019 JETS. All rights reserved.
//

import Foundation

// MARK: - UserJSON
struct UserJSON: Codable {
    let errorMessage: String
    let users: [User]
    let status: String
}

// MARK: - User
struct User: Codable {
    let country, countryID, dateOfBirth, email: String
    let firstName, gender, jobTitle, jobTitleID: String
    let lastName, middleName, organization, organizationID: String
    let password, profileImageURL, userName, uuid: String
    
    enum CodingKeys: String, CodingKey {
        case country
        case countryID = "countryId"
        case dateOfBirth, email, firstName, gender, jobTitle
        case jobTitleID = "jobTitleId"
        case lastName, middleName, organization
        case organizationID = "organizationId"
        case password
        case profileImageURL = "profileImageUrl"
        case userName, uuid
    }
}
