//
//  LoginViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/8/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    
}



- (IBAction)login:(id)sender {
    
    NSString *username = self.username.text;
    NSString *userpassword = self.password.text;
    
    [PFUser logInWithUsernameInBackground:username password:userpassword block:^(PFUser *user, NSError *error) {
        if (error)
        {
            NSLog(@"error: %@" , error);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Incorrect password or username" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            
            [alertView show];
        }
        else
        {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
    
}


@end
