//
//  ViewController.swift
//  GitHub-app
//
//  Created by user124076 on 1/2/17.
//  Copyright © 2017 user124076. All rights reserved.
//
import UIKit
import Kingfisher

protocol RepoSearchViewControllerOutput {
    func fetchRepos(query: String, sortMethod: String)
    func gotoRepoDetailScreen()
    func gotoUserDetailScreen()
    func passDataToNextScene(_ segue: UIStoryboardSegue)
}

protocol RepoSearchViewControllerInput: class{
    func displayFetchedRepos(_ repos: [Repo])
    func displayErrorView(_ errorMessage: String)
    
    func showWaitingView()
    func hideWaitingView()
}

class RepoSearchViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController : nil)
    
    var presenter: RepoSearchViewControllerOutput!
    
    var indexPathSelected: IndexPath = IndexPath()
    var selectedSortMethod:String = "stars"
    
    var repos = [Repo]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RepoSearchAssembly.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.defaultReuseIdentifier, for: indexPath) as! RepoCell
        
        let repo = repos[indexPath.row]
        cell.repoNameLabel.text = repo.name
        cell.userNameLabel.text = repo.user.userName
        
        cell.userThumbImageView.kf.setImage(with: URL(string: repo.user.imgURL))
        cell.userThumbImageView.isUserInteractionEnabled = true
        cell.userThumbImageView.tag = indexPath.row
        
        let tapped:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedOnImage(_:)))
        tapped.numberOfTapsRequired = 1
        cell.userThumbImageView.addGestureRecognizer(tapped)
        cell.userThumbImageView.tag = indexPath.row
        
        cell.forkNoLabel.text = "\(repo.forksNo) forks"
        cell.issueNoLabel.text = "\(repo.issuesNo) issues"
        cell.watcherNoLabel.text = "\(repo.watchersNo) watchers"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPathSelected = indexPath
        self.presenter.gotoRepoDetailScreen()
    }
    
    func tappedOnImage(_ sender:UITapGestureRecognizer){
        let view = sender.view
        let contentView = view?.superview
        let cell = contentView?.superview
        self.indexPathSelected = tableView.indexPath(for: cell as! UITableViewCell)!
        self.presenter.gotoUserDetailScreen()
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:  //stars selected
            self.selectedSortMethod = "stars"
            repos.sort{$0.stargazersNo > $1.stargazersNo}
            break
        case 1:   //forks selected
            self.selectedSortMethod = "forks"
            repos.sort{$0.forksNo > $1.forksNo}
            break
        default:  //date selected
            self.selectedSortMethod = "updated"
            repos.sort{$0.datePushed! > $1.datePushed!}
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.presenter.passDataToNextScene(segue)
    }
}

extension RepoSearchViewController:RepoSearchViewControllerInput{
    
    func displayFetchedRepos(_ repos: [Repo]) {
        self.repos = repos
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showWaitingView() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        alert.view.tintColor = UIColor.black
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = .gray
        loadingIndicator.startAnimating()
        
        alert.view.addSubview(loadingIndicator)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    func hideWaitingView() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func displayErrorView(_ errorMessage: String) {
        let refreshAlert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        refreshAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in
            refreshAlert.dismiss(animated:true, completion : nil)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
}

extension RepoSearchViewController : UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.presenter.fetchRepos(query:searchController.searchBar.text!, sortMethod: self.selectedSortMethod)
    }
    
}
