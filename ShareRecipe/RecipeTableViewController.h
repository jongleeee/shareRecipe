//
//  RecipeTableViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/8/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RecipeTableViewController : UITableViewController {
    AppDelegate *appDelegate;
}

@property (nonatomic, strong) NSMutableArray *bowlList;
@property (nonatomic, strong) PFObject *selectedRecipe;

@end
