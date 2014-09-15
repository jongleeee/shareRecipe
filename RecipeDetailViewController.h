//
//  RecipeDetailViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, strong) PFObject *selectedRecipe;

@end
