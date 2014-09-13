//
//  FriendsTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/10/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "FriendRecipeTableViewController.h"

@interface FriendsTableViewController ()

@end

@implementation FriendsTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];

}

- (void)viewWillAppear:(BOOL)animated
{
    
    PFRelation *friendsRelation = appDelegate.currentUser[@"friendsRelation"];
    
    PFQuery *query = [friendsRelation query];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {
            NSLog(@"%@", error);
        }
        else
        {
            self.friendsList = objects;
            [self.tableView reloadData];
        }
    }];


}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.friendsList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    

    PFUser *user = [self.friendsList objectAtIndex:indexPath.row];
    cell.textLabel.text = user[@"username"];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedUser = [self.friendsList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"friendRecipe" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"friendRecipe"])
    {
        FriendRecipeTableViewController *viewController = segue.destinationViewController;
        viewController.detailUser = self.selectedUser;
    }
}


@end
