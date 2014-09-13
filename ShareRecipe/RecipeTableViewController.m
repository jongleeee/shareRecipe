//
//  RecipeTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/8/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "RecipeTableViewController.h"
#import "LoginViewController.h"


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
    
    
    
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"login"])
    {
        LoginViewController *loginViewController = segue.destinationViewController;
        loginViewController.hidesBottomBarWhenPushed = YES;
        loginViewController.navigationItem.hidesBackButton = YES;
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
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"recipeDetail" sender:self];
}








@end
