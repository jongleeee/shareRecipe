//
//  AddRecipeViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "AddRecipeViewController.h"
#import "RecipeTimeViewController.h"
#import <Parse/Parse.h>
#import <MobileCoreServices/UTCoreTypes.h>


@interface AddRecipeViewController ()

@end

@implementation AddRecipeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.timeList = [NSArray arrayWithObjects:@"10 mins", @"20 mins", @"30 mins", @"40 mins", @"50 mins", @"60 mins", nil];

    self.timeSelect.delegate = self;
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = NO;
    
}



- (IBAction)donePressed:(id)sender {
    
    
    [self getTime];
    
    [self getImageAndUpload];
    
}







- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self takePhoto];
        
    }
    else if (buttonIndex == 1)
    {
        [self getPhoto];
        
    }
    
    
}


#pragma mark - picture and upload method

- (void)takePhoto
{
    
    // present the camera roll in ViewController

    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
    
    [self presentViewController:self.imagePicker animated:NO completion:nil];

}

- (void)getPhoto
{
    
    // present the camera album in ViewController
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
    
    [self presentViewController:self.imagePicker animated:NO completion:nil];
    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    // if cancel pressed, just dismiss the camera
    [self dismissViewControllerAnimated:NO completion:nil];
    
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    // check if the media is image
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        
        // get the image
        self.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        // if it was taken from the camera, save it in album
        if (self.imagePicker.sourceType == UIImagePickerControllerSourceTypeCamera)
        {
            UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);
        }
        
        // bring user back to the AddRecipe viewController
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height
{
    CGSize newSize = CGSizeMake(width, height);
    CGRect newRectangle = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContext(newSize);
    [self.image drawInRect:newRectangle];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}



// uploading information and get image
- (void)getImageAndUpload
{
    // uploading information before getting image
    NSString *recipeCategory = @"_Recipe";
    NSString *userRecipe = [appDelegate.currentUserName stringByAppendingString:recipeCategory];
    
    PFObject *recipe = [PFObject objectWithClassName:userRecipe];
    recipe[@"recipe"] = self.title;
    recipe[@"ingredients"] = self.ingredients;
    recipe[@"instructions"] = self.cookInstruction;
    recipe[@"time"] = self.cookTime;
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Recipe Image" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take picture", @"Choose from Album", @"No picture", nil];
    
    [actionSheet showInView:self.view];
    
    NSData *fileData;
    NSString *fileName = @"image.png";
    
    if (self.image == nil)
    {
        [recipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error)
            {
                NSLog(@"error: %@", error);
            }
            else
            {
                self.currentRecipe = recipe;
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
    // if the picture was taken or selected
    else
    {
        // resize image before submitting to Parse
        UIImage *newImage = [self resizeImage:self.image toWidth:320.0f andHeight:480.0f];
        fileData = UIImagePNGRepresentation(newImage);
        
        
        // save the image file in Parse
        PFFile *file = [PFFile fileWithName:fileName data:fileData];
        [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error)
            {
                NSLog(@"error: %@", error);
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Cannot recognize image" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alertView show];
            }
            else
            {
                // create a class for user_recipe and submit recipe with image
                [recipe setObject:file forKey:@"image"];
                [recipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (error)
                    {
                        NSLog(@"error: %@", error);
                    }
                    else
                    {
                        self.currentRecipe = recipe;
                        [self.navigationController popToRootViewControllerAnimated:YES];
                    }
                }];
                
                
                
            }
        }];
    
    }
    
}





#pragma mark - UIPickerView Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [self.timeList count];
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.timeList objectAtIndex:row];
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.time = row;
    
}


- (void)getTime
{
    switch (self.time) {
        case 0:
            self.cookTime = @"10";
            break;
        case 1:
            self.cookTime = @"20";
            break;
        case 2:
            self.cookTime = @"30";
            break;
        case 3:
            self.cookTime = @"40";
            break;
        case 4:
            self.cookTime = @"50";
            break;
        case 5:
            self.cookTime = @"60";
            break;
    }
}



@end
