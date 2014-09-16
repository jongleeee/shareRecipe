//
//  EditMyRecipeViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "EditMyRecipeViewController.h"

@interface EditMyRecipeViewController ()

@end

@implementation EditMyRecipeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.selectedRecipe[@"name"];
    self.theNewName.text = self.selectedRecipe[@"name"];
    self.theNewIngredient.text = self.selectedRecipe[@"ingredients"];
    self.theNewInstruction.text = self.selectedRecipe[@"instructions"];

    
    PFFile *image = self.selectedRecipe[@"image"];
    if (image.url)
    {
    NSURL *imageURL = [NSURL URLWithString:image.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    self.recipeImage.image = [UIImage imageWithData:imageData];
    }
    else
    {
        self.recipeImage.image = [UIImage imageNamed:@"restaurant"];
    }

}








- (IBAction)donePressed:(id)sender {
    
    if ([self.theNewName.text length] == 0 || [self.theNewInstruction.text length] == 0 || [self.theNewIngredient.text length] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please fill all the information!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        self.selectedRecipe[@"name"] = self.theNewName.text;
        self.selectedRecipe[@"ingredient"] = self.theNewIngredient.text;
        self.selectedRecipe[@"instruction"] = self.theNewInstruction.text;
        [self.selectedRecipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error)
            {
                NSLog(@"error: %@", error);
            }
            else
            {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
    
}
@end
