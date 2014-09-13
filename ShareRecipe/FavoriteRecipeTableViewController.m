//
//  FavoriteRecipeTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "FavoriteRecipeTableViewController.h"
#import "MyRecipeCustomTableViewCell.h"

@interface FavoriteRecipeTableViewController ()

@end

@implementation FavoriteRecipeTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"favoriteRecipeDetail" sender:self];
}


- (IBAction)myRecipe:(id)sender {
    
    [self performSegueWithIdentifier:@"myRecipe" sender:self];
    
}

- (IBAction)addRecipe:(id)sender {
    
    [self performSegueWithIdentifier:@"addRecipe" sender:self];
}
@end
