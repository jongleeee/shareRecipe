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
#import "MyRecipeCustomTableViewCell.h"
#import "RecipeDetailViewController.h"


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
    MyRecipeCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *recipe = [self.bowlList objectAtIndex:indexPath.row];
    
    cell.recipeName.text = recipe[@"name"];
    cell.recipeTime.text = recipe[@"time"];
    
    // getting the imageURL from the Parse
    NSString *imageURL = recipe[@"imageURL"];
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageURL];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    cell.recipePicture.image = [UIImage imageWithData:imageData];
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.selectedRecipe = [self.bowlList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"recipeDetail" sender:self];
}








@end
