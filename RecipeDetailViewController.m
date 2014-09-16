//
//  RecipeDetailViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    

}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.selectedRecipe[@"name"];
    self.ingredient.text = self.selectedRecipe[@"ingredients"];
    self.instruction.text = self.selectedRecipe[@"instructions"];
    self.time.text = self.selectedRecipe[@"time"];
    
    self.imageFile = self.selectedRecipe[@"image"];
    if (self.imageFile.url)
    {
    NSURL *imageURL = [[NSURL alloc] initWithString:self.imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    self.image.image = [UIImage imageWithData:imageData];
    }
    else
    {
        self.image.image = [UIImage imageNamed:@"restaurant"];
    }
}


- (IBAction)bowlPressed:(id)sender {
    
    NSString *favorite = @"_Bowl";
    NSString *addFavorite = [appDelegate.currentUserName stringByAppendingString:favorite];
    
    PFObject *newBowl = [PFObject objectWithClassName:addFavorite];
    newBowl[@"name"] = self.navigationItem.title;
    newBowl[@"ingredient"] = self.ingredient.text;
    newBowl[@"instruction"] = self.instruction.text;
    newBowl[@"time"] = self.time.text;
    newBowl[@"type"] = @"recipe";
    
    NSLog(@"adding bowl");
    NSLog(@"%@", self.imageFile.url);
    
    if (self.imageFile.url)
    {
        NSLog(@"WEnt IN");
        newBowl[@"imageURL"] = self.imageFile.url;
    }
    
    [newBowl saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
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
@end
