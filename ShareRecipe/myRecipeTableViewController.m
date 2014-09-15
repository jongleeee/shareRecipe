//
//  myRecipeTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "myRecipeTableViewController.h"
#import <Parse/Parse.h>
#import "MyRecipeCustomTableViewCell.h"
#import "EditMyRecipeViewController.h"

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
    
    //showing the Recipe I added
    NSString *recipe = @"_Recipe";
    NSString *myRecipe = [appDelegate.currentUserName stringByAppendingString:recipe];
    
    
    PFQuery *myList = [PFQuery queryWithClassName:myRecipe];
    [myList orderByAscending:@"updatedAt"];
    
    [myList findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {
            NSLog(@"error: %@", error);
        }
        else
        {
            self.myRecipeList = objects;
        }
    }];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editMyRecipe"])
    {
        EditMyRecipeViewController *viewController = (EditMyRecipeViewController *)segue.destinationViewController;
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

    
    return [self.myRecipeList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyRecipeCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *recipe = [self.myRecipeList objectAtIndex:indexPath.row];
    
    cell.recipeName.text = recipe[@"name"];
    cell.recipeTime.text = recipe[@"time"];
    
    PFFile *imageFile = [recipe objectForKey:@"image"];
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    cell.recipePicture.image = [UIImage imageWithData:imageData];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRecipe = [self.myRecipeList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"editMyRecipe" sender:self];
}


@end
