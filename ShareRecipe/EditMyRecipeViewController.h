//
//  EditMyRecipeViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditMyRecipeViewController : UIViewController


@property (nonatomic, strong) PFObject *selectedRecipe;
@property (strong, nonatomic) IBOutlet UIImageView *recipeImage;
@property (strong, nonatomic) IBOutlet UITextField *theNewName;
@property (strong, nonatomic) IBOutlet UITextView *theNewIngredient;
@property (strong, nonatomic) IBOutlet UITextView *theNewInstruction;


- (IBAction)donePressed:(id)sender;

@end
