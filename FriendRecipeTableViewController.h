//
//  FriendRecipeTableViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface FriendRecipeTableViewController : UITableViewController {
    AppDelegate *appDelegate;
}

@property (nonatomic, strong) NSArray *friendRecipeList;
@property (nonatomic, strong) PFUser *detailUser;
@property (strong, nonatomic) PFObject *selectedRecipe;

@end
