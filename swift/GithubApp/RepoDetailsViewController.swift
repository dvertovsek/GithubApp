//
//  RepoDetailsViewController.swift
//  GithubApp
//
//  Created by user124076 on 04.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

class RepoDetailsViewController: UIViewController, DetailsViewController {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var watchersNoLabel: UILabel!
    @IBOutlet weak var forksNoLabel: UILabel!
    @IBOutlet weak var issuesNoLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    @IBOutlet weak var progLangLabel: UILabel!
    @IBOutlet weak var detailsURLLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorInfoLabel: UILabel!
    @IBOutlet weak var starNoLabel: UILabel!
    
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
        
        let repo = model as! Repo
        
        repoNameLabel.text = repo.name
        watchersNoLabel.text = formatText(number: (repo.watchersNo), category: "watcher")
        forksNoLabel.text = formatText(number: (repo.forksNo), category: "fork")
        issuesNoLabel.text = formatText(number: (repo.issuesNo), category: "issue")
        starNoLabel.text = String(describing: (repo.stargazersNo))
        
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy, hh:mm:ss"
        
        createdAtLabel.text = dateFormatter.string(from: (repo.dateCreated)!)
        updatedAtLabel.text = dateFormatter.string(from: (repo.datePushed)!)
        progLangLabel.text = repo.progLang
        
        detailsURLLabel.text = repo.detailsURL
        detailsURLLabel.isUserInteractionEnabled = true
        
        let tapped:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOnLabel(_:)))
        tapped.numberOfTapsRequired = 1
        detailsURLLabel.addGestureRecognizer(tapped)
        
        authorImageView.kf.setImage(with: URL(string: (repo.user.imgURL)))
        
        authorInfoLabel.text = "\(repo.user.userName), \(repo.user.userType)"
    }
    
    func tappedOnLabel(_ sender:UITapGestureRecognizer){
        let urlLabel = sender.view as! UILabel
        self.presenter.openWebPage(url: urlLabel.text!)
    }
    
    func formatText(number:Int, category:String) -> String {
    
        switch number {
        case 0:
            return "no \(category)s"
        case 1:
            return "\(number) \(category)"
        default:
            return "\(number) \(category)s"
        }
        
    }

}
