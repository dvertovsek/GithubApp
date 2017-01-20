//
//  AuthorizationInteractor.swift
//  GithubApp
//
//  Created by user124076 on 09.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthorizationInteractorOutput {
    func notLoggedIn()
    func provideUser(_ authUser: AuthUser)
    func serviceError(_ errorMessage: String)
}

protocol AuthorizationInteractorInput {
    func fetchUserInfo()
    func login(user: String, pass:String)
    func logout()
}

class AuthorizationInteractor : AuthorizationInteractorInput {
   
    var presenter: AuthorizationInteractorOutput!
    var APIDataManager: RepoSearchProtocol!
    
    func fetchUserInfo() {
        if let username =  UserDefaults.standard.string(forKey: "usr")
        , let password = UserDefaults.standard.string(forKey: "pass")
        {
            callAPI(username, password)
        }else{
            self.presenter.notLoggedIn()
        }
    }
    
    func callAPI(_ username: String, _ password: String){
        APIDataManager.fetchUserWithCredentials(username: username, password: password){
            err,usr in
            if let authUser = usr{
                UserDefaults.standard.set(username, forKey: "usr")
                UserDefaults.standard.set(password, forKey: "pass")
                self.presenter.provideUser(authUser)
            }else if let errorMsg = err{
                self.presenter.serviceError(errorMsg)
            }
        }
    }
    
    internal func login(user: String, pass: String) {
        callAPI(user, pass)
    }
    
    internal func logout() {
        if let bundle = Bundle.main.bundleIdentifier{
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
        self.presenter.notLoggedIn()
    }

}
