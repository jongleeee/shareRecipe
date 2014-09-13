//
//  RecipeTimeViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/13/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "RecipeTimeViewController.h"

@interface RecipeTimeViewController ()

@end

@implementation RecipeTimeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.timeList = [[NSArray alloc] initWithObjects:@"10 min", @"20 min", @"30 min", @"40 min", @"50 min", @"60 min", nil];
    
    self.time.delegate = self;
    
}



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
    self.timeSelect = row;
    
}




- (IBAction)donePressed:(id)sender {
    
    switch (self.timeSelect) {
        case 0:
            self.currentRecipe[@"time"] = @"10";
            break;
        case 1:
            self.currentRecipe[@"time"] = @"20";
            break;
        case 2:
            self.currentRecipe[@"time"] = @"30";
            break;
        case 3:
            self.currentRecipe[@"time"] = @"40";
            break;
        case 4:
            self.currentRecipe[@"time"] = @"50";
            break;
        case 5:
            self.currentRecipe[@"time"] = @"60";
            break;
    }
    

    [self.currentRecipe saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
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
