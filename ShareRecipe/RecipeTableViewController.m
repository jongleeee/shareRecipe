//
//  RecipeTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/8/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "RecipeTableViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "RecipeDetailViewController.h"
#import "RecipeTableViewCell.h"

@interface RecipeTableViewController ()

@end

@implementation RecipeTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    NSLog(@"%@", appDelegate.currentUser);
    
    
    // if there is no current user, we go to login page
    if (!appDelegate.currentUser)
    {
        [self performSegueWithIdentifier:@"login" sender:self];
        
    }
    else
    {
        appDelegate.currentUser = appDelegate.currentUser;
        appDelegate.currentUserName = appDelegate.currentUser[@"username"];
        
        
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    // get the friends relation and "or" queries of friend's recipe using orQueryWithSubqueries
    if (appDelegate.currentUser)
    {
    PFRelation *friends = [appDelegate.currentUser relationForKey:@"friendsRelation"];
    PFQuery *query = [friends query];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {
            NSLog(@"Error: %@", error);
        }
        else
        {
            NSString *recipe = @"_Recipe";
            
            PFQuery *firstQuery;

            
            self.bowlList = [[NSMutableArray alloc] init];
            
            for (int i = 0; i < [objects count]; i++) {
                
                NSString *bowl = [[objects objectAtIndex:i][@"username"] stringByAppendingString:recipe];
                
                
                firstQuery = [PFQuery queryWithClassName:bowl];
                [firstQuery whereKey:@"type" equalTo:@"recipe"];
                [firstQuery orderByDescending:@"updatedAt"];
                
                [firstQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    if (error)
                    {
                        NSLog(@"%@", error);
                    }
                    else
                    {
                        [self.bowlList addObjectsFromArray:objects];
                        [self.tableView reloadData];
                    }
                }];
            
            }
            
        }
    }];
    }
    
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"login"])
    {
        LoginViewController *loginViewController = segue.destinationViewController;
        loginViewController.hidesBottomBarWhenPushed = YES;
        loginViewController.navigationItem.hidesBackButton = YES;
    }
    else if ([segue.identifier isEqualToString:@"recipeDetail"])
    {
        RecipeDetailViewController *viewController = (RecipeDetailViewController *)segue.destinationViewController;
        viewController.selectedRecipe = self.selectedRecipe;
        viewController.tabBarController.hidesBottomBarWhenPushed = YES;
    }
    
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
    return [self.bowlList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *recipe = [self.bowlList objectAtIndex:indexPath.row];
    
    cell.name.text = recipe[@"name"];
    cell.time.text = recipe[@"time"];
    
    // getting the imageURL from the Parse
    PFFile *image = recipe[@"image"];
    if (image.url)
    {
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:image.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
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
    
    self.selectedRecipe = [self.bowlList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"recipeDetail" sender:self];
}








@end
