//
//  JSONManager.swift
//  GithubApp
//
//  Created by user124076 on 03.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//
import SwiftyJSON

class JSONManager{
    static func parseJSON(jsonObj : AnyObject) -> [Repo] {
        var repoArray = [Repo]()
        
        let json = JSON(jsonObj)
        
        repoArray = json["items"].arrayValue.map({
            let repo : Repo = Repo()
            repo.user.userName = $0["owner"]["login"].stringValue
            repo.user.imgURL = $0["owner"]["avatar_url"].stringValue
            repo.user.userType = $0["owner"]["type"].stringValue
            repo.user.detailsURL = $0["owner"]["html_url"].stringValue
            
            repo.name = $0["name"].stringValue
            repo.forksNo = $0["forks"].intValue
            repo.issuesNo = $0["open_issues"].intValue
            repo.watchersNo = $0["watchers_count"].intValue
            repo.stargazersNo = $0["stargazers_count"].intValue
            
            repo.progLang = $0["language"].stringValue
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            repo.dateCreated = dateFormatter.date(from: $0["created_at"].stringValue)
            repo.datePushed = dateFormatter.date(from :$0["pushed_at"].stringValue)
            
            repo.detailsURL = $0["html_url"].stringValue
            return repo
        })
        
        
        return repoArray
    }

    static func parseJSONUser(jsonObj: AnyObject) -> AuthUser {
    
        let userJSON = JSON(jsonObj)
        
        let userAuth : AuthUser = AuthUser()
        userAuth.location = userJSON["location"].stringValue
        userAuth.login = userJSON["login"].stringValue
        userAuth.name = userJSON["name"].stringValue
        userAuth.public_repos = userJSON["public_repos"].stringValue
        userAuth.type = userJSON["type"].stringValue
        
        return userAuth
    }
}
