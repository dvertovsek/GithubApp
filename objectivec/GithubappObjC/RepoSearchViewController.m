//
//  TableViewController.m
//  GithubappObjC
//
//  Created by user124076 on 05.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

#import "RepoSearchViewController.h"

@interface RepoSearchViewController () <UISearchBarDelegate>


@end

@implementation RepoSearchViewController

-(void) awakeFromNib{
    [super awakeFromNib];
    
    [RepoSearchAssembly configure:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //todo: naci negdje drugo mjesto gdje bi se moglo deklarirati
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.selectedSortMethod = @"stars";
    
    self.searchController.searchBar.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = false;
    self.definesPresentationContext = true;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
}

-(void)addRepos:(NSArray *)repos{
    self.repos = repos;
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [[self tableView] reloadData];
        });
    });
}

-(void) showErrorMessage:(NSError *)error{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];

    [self presentViewController:alertController animated:true completion:nil];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [self.presenter fetchRepos:searchBar.text withSortMethod:self.selectedSortMethod];
}

-(IBAction)segmentedControlValueChanged:(UISegmentedControl*)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:  //stars selected
            self.selectedSortMethod = @"stars";
            
            self.repos = [self.repos sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *d1, NSDictionary *d2){
                
                return (int)d1[@"stargazers_count"] < (int)d2[@"stargazers_count"];
                
            }];
            break;
        case 1:   //forks selected
            self.selectedSortMethod = @"forks";
            
            self.repos = [self.repos sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *d1, NSDictionary *d2){
                
                return (int)d1[@"forks_count"] < (int)d2[@"forks_count"];
                
            }];
            break;
        default:  //date selected
            self.selectedSortMethod = @"updated";
            
            self.repos = [self.repos sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *d1, NSDictionary *d2){
                
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
                NSDate *date1 = [dateFormatter dateFromString:d1[@"pushed_at"]];
                NSDate *date2 = [dateFormatter dateFromString:d2[@"pushed_at"]];
                
                NSComparisonResult result = [date1 compare:date2];
                
                switch (result)
                {
                    case NSOrderedAscending: return true;
                    default: return false;
                }
                
            }];
    }
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        dispatch_async(dispatch_get_main_queue(), ^(void){
            [[self tableView] reloadData];
        });
    });
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self repos]count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UIScreen mainScreen] bounds].size.height * 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoCell *cell =[tableView dequeueReusableCellWithIdentifier:@"RepoCell" forIndexPath:indexPath];
    
    NSDictionary* repo = self.repos[indexPath.row];
    
    cell.repoNameLabel.text = repo[@"name"];
    cell.userNameLabel.text = repo[@"owner"][@"login"];
    
    cell.forkNoLabel.text = [NSString stringWithFormat:@"%@ forks", repo[@"forks_count"]];
    cell.issueNoLabel.text = [NSString stringWithFormat:@"%@ issues", repo[@"open_issues"]];
    cell.watcherNoLabel.text = [NSString stringWithFormat:@"%@ watchers", repo[@"watchers_count"]];
    
    [cell.userThumbImageView sd_setImageWithURL:[NSURL URLWithString:repo[@"owner"][@"avatar_url"]]
                 placeholderImage:[UIImage imageNamed:@"placeholder-user"]];
    
    cell.userThumbImageView.userInteractionEnabled = true;
    cell.userThumbImageView.tag = indexPath.row;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedOnImage:)];
    tapped.numberOfTapsRequired = 1;
    [cell.userThumbImageView addGestureRecognizer:tapped];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.presenter gotoRepoDetailScreen];
}

-(void)tappedOnImage:(UITapGestureRecognizer*)sender{
    UIImageView *senderImageView = (UIImageView *)sender.view;
    self.selectedIndexPath = senderImageView.tag;
    [self.presenter gotoUserDetailScreen];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [[self presenter] passDataToNextScene:segue];
}


@end
