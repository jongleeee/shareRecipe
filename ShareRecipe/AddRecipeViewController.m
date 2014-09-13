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

}



- (IBAction)donePressed:(id)sender {
    
    if ([self.recipeTitle.text length] == 0 || [self.ingredients.text length] == 0 || [self.cookInstruction.text length] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please fill all the information!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        NSString *parse_title = self.recipeTitle.text;
        NSString *parse_ingredient = self.ingredients.text;
        NSString *parse_instruction = self.cookInstruction.text;
        
        NSString *addRecipe = [appDelegate.currentUserName stringByAppendingString:@"_Recipe"];
        
        PFObject *newRecipe = [PFObject objectWithClassName:addRecipe];
        
        newRecipe[@"name"] = parse_title;
        newRecipe[@"ingredient"] = parse_ingredient;
        newRecipe[@"instruction"] = parse_instruction;
        
        [newRecipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error)
            {
                NSLog(@"error: %@", error);
            }
            else
            {
                self.currentRecipe = newRecipe;
                [self performSegueWithIdentifier:@"addTime" sender:self];
            }
        }];
        
        
    }
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addTime"])
    {
        RecipeTimeViewController *viewController = segue.destinationViewController;
        viewController.currentRecipe = self.currentRecipe;
    }
}



- (IBAction)imagePressed:(id)sender {
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo", @"Choose from album", nil];
    
    [action showInView:self.view];
}



- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self takePhoto];
        [self upload];
        
    }
    else if (buttonIndex == 1)
    {
        [self getPhoto];
        [self upload];
        
    }
    
    
}


#pragma mark - picture and upload method

- (void)takePhoto
{

    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
    
    [self presentViewController:self.imagePicker animated:NO completion:nil];

}

- (void)getPhoto
{
    
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
    
    [self presentViewController:self.imagePicker animated:NO completion:nil];
    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        self.image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        
        if (self.imagePicker.sourceType == UIImagePickerControllerSourceTypeCamera)
        {
            UIImageWriteToSavedPhotosAlbum(self.image, nil, nil, nil);
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)upload
{
    
}


@end
