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
    
    
    PFFile *imageFile = [self.selectedRecipe objectForKey:@"image"];
    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
    self.recipeImage.image = [UIImage imageWithData:imageData];
    
    
    
}

@end
