//
//  Constants.swift
//  Email
//
//  Created by Yael Javier Zamora Moreno on 29/05/23.
//

import Foundation

struct Constants{
    var email = ""
    
    let noSupportText = "You need to set a mail account in order to leave a feedback"
    let contentPreText = "I would like to give you my honest feedback."
    let sendButtonText = "Give Feedback"
    let subject = "Feedback"
    
    static let shared = Constants()
    
    init() {
        if let file = Bundle.main.path(forResource: "Email", ofType: "txt"){
            do {
                self.email = try String(contentsOfFile: file)
            } catch let error {
                print(error)
            }
        }
    }
}
