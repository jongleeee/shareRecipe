//
//  AddRecipeViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AddRecipeViewController : UIViewController {
    AppDelegate *appDelegate;
}
@property (strong, nonatomic) IBOutlet UIImageView *picture;
@property (strong, nonatomic) IBOutlet UITextView *ingredients;
@property (strong, nonatomic) IBOutlet UITextField *recipeTitle;
@property (strong, nonatomic) IBOutlet UITextView *cookInstruction;
@property (strong, nonatomic) PFObject *currentRecipe;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@property (strong, nonatomic) UIImage *image;

- (IBAction)donePressed:(id)sender;
- (IBAction)imagePressed:(id)sender;

- (void)takePhoto;
- (void)getPhoto;
- (void)upload;

@end
