//
//  RepoModel.swift
//  Test Project
//
//  Created by maedeh on 5/10/1399 AP.
//  Copyright © 1399 maedeh. All rights reserved.
//

import Foundation
import ObjectMapper


public class RepoModel :  Mappable {
    
    public required init?(){
    }
    
    public required init?(map: Map){
    }
    
    var repoName: String = "";
    var creationDate: String = "";
    
    public func mapping(map: Map){
        
        repoName <- map["name"]
        creationDate <- map["created_at"]
    }
}
