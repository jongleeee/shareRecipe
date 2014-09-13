//
//  AddRecipeViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "AddRecipeViewController.h"
#import <Parse/Parse.h>

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
    }
}

- (IBAction)imagePressed:(id)sender {
    
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo", @"Choose from album", nil];
    
    [action showInView:self.view];
}
@end
