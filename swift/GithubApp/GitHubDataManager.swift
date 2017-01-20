//
//  GitHubApiManager.swift
//  GithubApp
//
//  Created by user124076 on 02.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//
import Alamofire
import SwiftyJSON

protocol RepoSearchProtocol: class{
    func fetchReposForSearchQuery(query: String, sortMethod: String, closure:@escaping(Error?, [Repo]?)-> Void )
    func fetchUserWithCredentials(username: String, password: String, closure:@escaping(String?, AuthUser?)-> Void )
}

class GitHubDataManager: RepoSearchProtocol{
    
    struct GitHubAPI {
        static let apiURL = "https://api.github.com"
        static let searchRepoURL = "/search/repositories"
        static let userAuthURL = "/user"
    }
    
    internal func fetchReposForSearchQuery(query: String, sortMethod: String, closure: @escaping (Error?, [Repo]?) -> Void) {
        
        var params = [String : String]()
        params["q"] = query
        params["sort"] = sortMethod
        
        Alamofire.request(GitHubAPI.apiURL+GitHubAPI.searchRepoURL, method: HTTPMethod.get, parameters : params).responseJSON
            { response in
                if let result = response.result.value{
                    let repoArray = JSONManager.parseJSON(jsonObj: result as AnyObject)
                    closure(nil, repoArray)
                }else if let error = response.result.error{
                    closure(error, nil)
                }
        }
    }
    
    internal func fetchUserWithCredentials(username: String, password: String, closure: @escaping (String?, AuthUser?) -> Void) {
        
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)
        let base64Credentials = credentialData?.base64EncodedString()
        
        let headers : HTTPHeaders =
            ["Authorization" : "Basic \(base64Credentials!)"]
        
        Alamofire.request(GitHubAPI.apiURL+GitHubAPI.userAuthURL,  headers: headers).responseJSON
            { response in
                if (response.response?.statusCode)! == 200{
                    if let result = response.result.value{
                        let authUser = JSONManager.parseJSONUser(jsonObj: result as AnyObject)
                        closure(nil, authUser)
                    }
                } else if(response.response?.statusCode)! == 401{
                    closure("Wrong credentials", nil)
                }
                
        }
    }
}
