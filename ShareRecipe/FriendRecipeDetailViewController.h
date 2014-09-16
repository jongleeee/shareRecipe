//
//  FriendRecipeDetailViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendRecipeDetailViewController : UIViewController
@property (strong, nonatomic) PFObject *selectedRecipe;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UITextView *ingredient;
@property (strong, nonatomic) IBOutlet UITextView *instruction;


@end
