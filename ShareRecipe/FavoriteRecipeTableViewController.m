//
//  FavoriteRecipeTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "FavoriteRecipeTableViewController.h"
#import "MyRecipeCustomTableViewCell.h"
#import "FavoriteRecipeDetailViewController.h"
#import "MyRecipeCustomTableViewCell.h"

@interface FavoriteRecipeTableViewController ()

@end

@implementation FavoriteRecipeTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];

}


- (void)viewWillAppear:(BOOL)animated
{
    NSString *bowl = @"_Bowl";
    NSString *favorite = [appDelegate.currentUserName stringByAppendingString:bowl];
    
    PFQuery *query = [PFQuery queryWithClassName:favorite];
    [query orderByDescending:@"updatedAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error)
        {
            NSLog(@"error: %@", error);
        }
        else
        {
            self.bowlRecipe = objects;
        }
    }];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"favoriteRecipeDetail"])
    {
        FavoriteRecipeDetailViewController *viewController = (FavoriteRecipeDetailViewController *)segue.destinationViewController;
        viewController.selectedRecipe = self.selectedRecipe;
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bowlRecipe count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyRecipeCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *recipe = [self.bowlRecipe objectAtIndex:indexPath.row];
    
    cell.recipeName.text = recipe[@"name"];
    cell.recipeTime.text = recipe[@"time"];
    
    PFFile *imageFile = [recipe objectForKey:@"imageURL"];
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    cell.recipePicture.image = [UIImage imageWithData:imageData];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedRecipe = [self.bowlRecipe objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"favoriteRecipeDetail" sender:self];
}


- (IBAction)myRecipe:(id)sender {
    
    [self performSegueWithIdentifier:@"myRecipe" sender:self];
    
}

- (IBAction)addRecipe:(id)sender {
    
    [self performSegueWithIdentifier:@"addRecipe" sender:self];
}
@end
