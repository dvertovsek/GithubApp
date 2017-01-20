//
//  Repository.swift
//  GithubApp
//
//  Created by user124076 on 03.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation

class Repo : Model{
    var detailsURL: String = ""
    
    public var user : User = User()
    
    public var name : String = ""
    public var watchersNo : Int = 0
    public var forksNo : Int = 0
    public var issuesNo : Int = 0
    public var stargazersNo : Int = 0
    
    public var progLang : String = ""
    public var dateCreated : Date?
    public var datePushed : Date?
    
}
