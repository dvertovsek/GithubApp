//
//  RepositoryTableViewCell.swift
//  GithubApp
//
//  Created by user124076 on 03.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var userThumbImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var forkNoLabel: UILabel!
    
    @IBOutlet weak var issueNoLabel: UILabel!
    
    @IBOutlet weak var watcherNoLabel: UILabel!
    
    @IBOutlet weak var repoNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
