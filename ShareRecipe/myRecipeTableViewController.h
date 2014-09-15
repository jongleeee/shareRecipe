//
//  myRecipeTableViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface myRecipeTableViewController : UITableViewController {
    AppDelegate *appDelegate;
}

@property (nonatomic, strong) NSArray *myRecipeList;
@property (nonatomic, strong) PFObject *selectedRecipe;
@end
