//
//  repoServices.swift
//  Test Project
//
//  Created by maedeh on 5/10/1399 AP.
//  Copyright © 1399 maedeh. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

public protocol IRepoServices {
    func repoListReceived(_ result: [RepoModel])
    func profileReceived(_ result: ProfileModel)
    func errorReceived(_ result: String)
}

public class RepoServices {
    public func GetRepos(_ username: String, _ iRepoServices: IRepoServices){
        
        let url = "https://api.github.com/users/\(username)/repos";
        
        Alamofire.SessionManager.default
            .request(url,
                     method: .get,
                     parameters: nil,
                     encoding: JSONEncoding.default)
            .responseArray { (response: DataResponse<[RepoModel]>) in
                switch response.result {
                case .success:
                    let responseData = response.result.value!;
                    iRepoServices.repoListReceived(responseData)
                case .failure:
                    iRepoServices.errorReceived("error in get repo")
                }
        }
    }
    
    public func GetProfile(_ username: String, _ iRepoServices: IRepoServices){
        
        let url = "https://api.github.com/users/\(username)";
        
        Alamofire.SessionManager.default
            .request(url,
                     method: .get,
                     parameters: nil,
                     encoding: JSONEncoding.default)
            .responseObject { (response: DataResponse<ProfileModel>) in
                switch response.result {
                case .success:
                    let responseData = response.result.value!;
                    iRepoServices.profileReceived(responseData)
                case .failure:
                    iRepoServices.errorReceived("error in get profile")
                }
        }
    }
}

