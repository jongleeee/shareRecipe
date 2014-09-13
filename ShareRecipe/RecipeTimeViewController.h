//
//  RecipeTimeViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/13/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface RecipeTimeViewController : UIViewController

@property (nonatomic, strong) PFObject *currentRecipe;

@property (strong, nonatomic) IBOutlet UIPickerView *time;
@property (strong, nonatomic) NSArray *timeList;
@property (nonatomic, readwrite) NSInteger timeSelect;


- (IBAction)donePressed:(id)sender;
@end
