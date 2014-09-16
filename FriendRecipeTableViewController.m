//
//  FriendRecipeTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "FriendRecipeTableViewController.h"
#import "FriendRecipeDetailViewController.h"
#import "FriendsDetailTableViewCell.h"


@interface FriendRecipeTableViewController ()

@end

@implementation FriendRecipeTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    NSString *recipe = @"_Recipe";
    NSString *friendRecipe = [self.detailUser[@"username"] stringByAppendingString:recipe];
    
    PFQuery *query = [PFQuery queryWithClassName:friendRecipe];
    [query whereKey:@"type"equalTo:@"recipe"];
    [query orderByDescending:@"updatedAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {
            NSLog(@"error: %@", error);
        }
        else
        {
            self.friendRecipeList = objects;
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
    return [self.friendRecipeList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *currentRecipe = [self.friendRecipeList objectAtIndex:indexPath.row];

    cell.name.text = currentRecipe[@"name"];
    cell.time.text = currentRecipe[@"time"];
    
    PFFile *imageFile = currentRecipe[@"image"];
    
    if (imageFile.url)
    {
    NSURL *imageURL = [NSURL URLWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    cell.image.image = [UIImage imageWithData:imageData];
    }
    else
    {
        cell.image.image = [UIImage imageNamed:@"restaurant"];
    }
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRecipe = [self.friendRecipeList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"detailFriendRecipe" sender:self];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"detailFriendRecipe"])
    {
        FriendRecipeDetailViewController *viewController = (FriendRecipeDetailViewController *)segue.destinationViewController;
        viewController.selectedRecipe = self.selectedRecipe;
        viewController.tabBarController.hidesBottomBarWhenPushed = YES;
        
    }

}

@end
