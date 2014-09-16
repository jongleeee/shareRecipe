//
//  RecipeDetailViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"

@interface RecipeDetailViewController : UIViewController {
    AppDelegate *appDelegate;
}

@property (nonatomic, strong) PFObject *selectedRecipe;
- (IBAction)bowlPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UITextView *ingredient;
@property (strong, nonatomic) IBOutlet UITextView *instruction;
@property (strong, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) PFFile *imageFile;



@end
