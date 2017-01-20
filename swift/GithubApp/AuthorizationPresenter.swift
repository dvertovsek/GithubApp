//
//  AuthorizationPresenter.swift
//  GithubApp
//
//  Created by user124076 on 09.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import Foundation

class AuthorizationPresenter: AuthorizationInteractorOutput, AuthorizationViewControllerOutput {

    weak var view: AuthorizationViewControllerInput!
    var interactor: AuthorizationInteractorInput!

    func requestUserInfo(){
        self.interactor.fetchUserInfo()
    }
    
    internal func notLoggedIn() {
        self.view.showLoginScreen(message: "Login required")
    }
    
    internal func requestLogin(user: String, pass: String) {
        self.interactor.login(user: user,pass: pass)
    }
    
    internal func logout() {
        self.interactor.logout()
    }
    
    internal func serviceError(_ errorMessage: String) {
        self.view.showLoginScreen(message: errorMessage)
    }
    
    internal func provideUser(_ authUser: AuthUser) {
        self.view.addUser(authUser: authUser)
    }
}
