//
//  AuthorizationViewController.swift
//  GithubApp
//
//  Created by user124076 on 09.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

protocol AuthorizationViewControllerOutput {
    func requestUserInfo()
    func requestLogin(user: String, pass: String)
    func logout()
}

protocol AuthorizationViewControllerInput : class {
    func showLoginScreen(message: String)
    func addUser(authUser : AuthUser)
}

class AuthorizationViewController: UIViewController, AuthorizationViewControllerInput{

    @IBOutlet weak var loginLabel:UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var locationLabel:UILabel!
    @IBOutlet weak var reposLabel:UILabel!
    
    var presenter: AuthorizationViewControllerOutput!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        AuthorizationAssembly.sharedInstance.configure(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.requestUserInfo()
    }

    internal func addUser(authUser: AuthUser) {
        
        loginLabel.text = authUser.login
        nameLabel.text = authUser.name + " "+authUser.type
        locationLabel.text = authUser.location
        reposLabel.text = "Public repos: \(authUser.public_repos)"
    }
    
    @IBAction func logoutButtonPressed(){
        loginLabel.text = ""
        nameLabel.text = ""
        locationLabel.text = ""
        reposLabel.text = ""
        self.presenter.logout()
    }
    
    internal func showLoginScreen(message: String) {
        let alert = UIAlertController(title: "Login required", message: message, preferredStyle: .alert)
        
        alert.view.tintColor = UIColor.black

        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.cancel){ _ in
            _ = self.navigationController?.popViewController(animated: true)
        })

        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){ _ in
            let usernameStr = alert.textFields?[0].text
            let passStr = alert.textFields?[1].text
            if (usernameStr != "" && passStr != ""){
                self.presenter.requestLogin(user: usernameStr!, pass: passStr!)
            }
        })
        
        alert.addTextField(configurationHandler: configureUsernameField)
        alert.addTextField(configurationHandler: configurePasswordField)
        
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func configureUsernameField(textField : UITextField!){
        if(textField) != nil{
            textField.placeholder = "Username"
        }
    }
    
    func configurePasswordField(textField : UITextField!){
        if(textField) != nil{
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
    }


    
}
