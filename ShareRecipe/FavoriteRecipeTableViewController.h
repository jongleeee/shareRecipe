//
//  FavoriteRecipeTableViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface FavoriteRecipeTableViewController : UITableViewController {
    AppDelegate *appDelegate;
}

@property (nonatomic, strong) NSArray *bowlRecipe;
@property (nonatomic, strong) PFObject *selectedRecipe;

- (IBAction)myRecipe:(id)sender;
- (IBAction)addRecipe:(id)sender;

@end
