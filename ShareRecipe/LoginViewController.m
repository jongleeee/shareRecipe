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
    
    self.navigationItem.hidesBackButton = YES;
    
    [self.username setDelegate:self];
    [self.password setDelegate:self];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)login:(id)sender {
    
    NSString *username = self.username.text;
    NSString *userpassword = self.password.text;
    
    if ([username length] == 0 || [userpassword length] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Please fill all the information!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
    [PFUser logInWithUsernameInBackground:username password:userpassword block:^(PFUser *user, NSError *error) {
        if (error)
        {
            NSLog(@"error: %@" , error);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Incorrect password or username" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            
            [alertView show];
        }
        else
        {
            
            appDelegate.currentUser = user;
            appDelegate.currentUserName = username;
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
    }
    
}


@end
