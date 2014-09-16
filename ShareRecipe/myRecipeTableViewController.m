//
//  myRecipeTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "myRecipeTableViewController.h"
#import <Parse/Parse.h>
#import "EditMyRecipeViewController.h"
#import "MyRecipeTableViewCell.h"

@interface myRecipeTableViewController ()

@end

@implementation myRecipeTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];

}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    //showing the Recipe I added
    NSString *recipe = @"_Recipe";
    NSString *myRecipe = [appDelegate.currentUserName stringByAppendingString:recipe];
    
    PFQuery *myList = [PFQuery queryWithClassName:myRecipe];
    [myList whereKey:@"type" equalTo:@"recipe"];
    [myList orderByAscending:@"updatedAt"];
    
    [myList findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {
            NSLog(@"error: %@", error);
        }
        else
        {
            self.myRecipeList = objects;
            [self.tableView reloadData];
            NSLog(@"There are %d", [objects count]);
        }
    }];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editMyRecipe"])
    {
        EditMyRecipeViewController *viewController = (EditMyRecipeViewController *)segue.destinationViewController;
        viewController.selectedRecipe = self.selectedRecipe;
        viewController.navigationController.hidesBottomBarWhenPushed = YES;
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

    return [self.myRecipeList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyRecipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    PFObject *recipe = [self.myRecipeList objectAtIndex:indexPath.row];
    
    cell.recipeName.text = recipe[@"name"];
    cell.recipeTime.text = recipe[@"time"];
    
    
    PFFile *imageFile = [recipe objectForKey:@"image"];
    if (imageFile.url)
    {
        NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
        NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
        cell.recipeImage.image = [UIImage imageWithData:imageData];
    }
    else
    {
        cell.recipeImage.image = [UIImage imageNamed:@"restaurant"];
    }
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRecipe = [self.myRecipeList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"editMyRecipe" sender:self];
}



@end
