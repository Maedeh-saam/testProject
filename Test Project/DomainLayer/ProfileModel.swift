//
//  ProfileModel.swift
//  Test Project
//
//  Created by maedeh on 5/10/1399 AP.
//  Copyright © 1399 maedeh. All rights reserved.
//

import Foundation
import ObjectMapper


public class ProfileModel :  Mappable {
    
    public required init?(){
    }
    
    public required init?(map: Map){
    }
    
    var profileImage: String = "";
    var username: String = "";
    var bio: String = "";
    var email: String = "";
    var company: String = "";
    
    public func mapping(map: Map){
        
        profileImage <- map["avatar_url"]
        username <- map["login"]
        bio <- map["bio"]
        email <- map["email"]
        company <- map["company"]
    }
}
