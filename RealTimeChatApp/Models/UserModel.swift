//
//  UserModel.swift
//  RealTimeChatroom
//
//  Created by Miya Lee on 24/08/2021.
//

//import Foundation
import UIKit

//class UserModel {
//    var uid = ""
//    var username = ""
//    var email = ""
//    var profilePicUrl = ""
//    var timeStamp = ""
//
//    init(uid: String, username: String, email: String//,profilePicUrl: String, timeStamp: String
//         ) {
//        self.uid = uid
//        self.username = username
//        self.email = email
//        self.profilePicUrl = profilePicUrl
//        self.timeStamp = timeStamp
//    }
//}

class ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
//    let profilePictureUrl: String
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "=")
        return safeEmail
    }
    
    init(firstName: String, lastName: String, emailAddress: String){
        self.firstName = firstName
        self.lastName = lastName
        self.emailAddress = emailAddress
    }
}
