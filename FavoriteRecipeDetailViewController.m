//
//  FavoriteRecipeDetailViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "FavoriteRecipeDetailViewController.h"
#import <Parse/Parse.h>

@interface FavoriteRecipeDetailViewController ()

@end

@implementation FavoriteRecipeDetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.selectedRecipe[@"name"];
    self.recipeIngrdient.text = self.selectedRecipe[@"ingredient"];
    self.recipeInstruction.text = self.selectedRecipe[@"instruction"];
    self.recipeTime.text = self.selectedRecipe[@"time"];
    
    NSString *imageFileURL = [self.selectedRecipe objectForKey:@"imageURL"];
    
    if (imageFileURL)
    {
        
        NSURL *imageFile = [[NSURL alloc] initWithString:imageFileURL];
        NSData *imageData = [NSData dataWithContentsOfURL:imageFile];
        self.recipeImage.image = [UIImage imageWithData:imageData];
    }
    else
    {
        self.recipeImage.image = [UIImage imageNamed:@"restaurant"];
    }
    
    
}





@end
