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


// Picker View properties

@property (strong, nonatomic) IBOutlet UIPickerView *timeSelect;
@property (nonatomic, strong) NSArray *timeList;
@property (nonatomic, readwrite) NSInteger time;
@property (nonatomic, strong) NSString *cookTime;


- (IBAction)donePressed:(id)sender;

- (void)takePhoto;
- (void)getPhoto;
- (void)getImageAndUpload;
- (UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;

- (void)getTime;
- (void)upload;

@end
