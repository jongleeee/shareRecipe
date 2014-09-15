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
    self.newName.text = self.selectedRecipe[@"name"];
    self.newIngredient.text = self.selectedRecipe[@"ingredient"];
    self.newInstruction.text = self.selectedRecipe[@"instruction"];

}








- (IBAction)donePressed:(id)sender {
    
    if ([self.newName.text length] == 0 || [self.newInstruction.text length] == 0 || [self.newIngredient.text length] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please fill all the information!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        self.selectedRecipe[@"name"] = self.newName.text;
        self.selectedRecipe[@"ingredient"] = self.newIngredient.text;
        self.selectedRecipe[@"instruction"] = self.newInstruction.text;
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
