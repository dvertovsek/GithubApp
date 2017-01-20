//
//  UserDetailsViewController.swift
//  GithubApp
//
//  Created by user124076 on 04.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController, DetailsViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userTypeLabel: UILabel!
    @IBOutlet weak var detailsURLLabel: UILabel!
    
    var presenter: DetailsViewControllerOutput = DetailsPresenter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DetailsAssembly.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.requestModel()
    }
    
    internal func addModel(_ model: Model) {
        
        let user = model as! User
        
        self.title = (user.userName) + self.title!
        
        userImageView.kf.setImage(with: URL(string: (user.imgURL)))
        userNameLabel.text = user.userName
        userTypeLabel.text = user.userType
        
        detailsURLLabel.text = user.detailsURL
        detailsURLLabel.isUserInteractionEnabled = true
        
        let tapped:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_:)))
        tapped.numberOfTapsRequired = 1
        detailsURLLabel.addGestureRecognizer(tapped)
    }
    
    func tappedOnLabel(_ sender:UITapGestureRecognizer){
        let urlLabel = sender.view as! UILabel
        self.presenter.openWebPage(url: urlLabel.text!)
    }

}
