//
//  FriendRecipeDetailViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "FriendRecipeDetailViewController.h"

@interface FriendRecipeDetailViewController ()

@end

@implementation FriendRecipeDetailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = self.selectedRecipe[@"name"];
    self.time.text = self.selectedRecipe[@"time"];
    self.ingredient.text = self.selectedRecipe[@"ingredients"];
    self.instruction.text = self.selectedRecipe[@"instructions"];
    
    PFFile *image = self.selectedRecipe[@"image"];
    if (image.url)
    {
    NSURL *imageURL = [NSURL URLWithString:image.url];
    NSData *imageFile = [NSData dataWithContentsOfURL:imageURL];
    self.image.image = [UIImage imageWithData:imageFile];
    }
    else
    {
        self.image.image = [UIImage imageNamed:@"restaurant"];
    }
        
}


@end
