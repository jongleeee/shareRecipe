//
//  FavoriteRecipeDetailViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FavoriteRecipeDetailViewController : UIViewController

@property PFObject *selectedRecipe;

@property (strong, nonatomic) IBOutlet UIImageView *recipeImage;
@property (strong, nonatomic) IBOutlet UITextView *recipeInstruction;
@property (strong, nonatomic) IBOutlet UITextView *recipeIngrdient;
@property (strong, nonatomic) IBOutlet UILabel *recipeTime;

@end
