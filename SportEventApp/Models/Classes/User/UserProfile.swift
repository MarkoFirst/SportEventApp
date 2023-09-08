//
//  UserProfile.swift
//  SportEvent
//
//  Created by Дима Самойленко on 18.08.2023.
//

import Foundation

class UserProfile {
    var firstName: String
    var lastName: String
    var age: Int
    var mail: String
    var password: String
    
    
    init(firstName: String, lastName: String, age: Int, mail: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.mail = mail
        self.password = password
    }
    
    func changeFirstName(firstName: String) {
        self.firstName = firstName
    }
    
    func changelastName(lastName: String) {
        self.lastName = lastName
    }
    
    func changeAge(age: Int) {
        self.age = age
    }
    
    func changeMail(mail: String) {
        self.mail = mail
    }
    
    func changePassword(password: String) {
        self.password = password
    }
}
