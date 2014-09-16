//
//  RegisterViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/9/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "RegisterViewController.h"
#import <Parse/Parse.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem.title = @"login";
  
    // sharing property of appDelegate
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    [self.username setDelegate:self];
    [self.password setDelegate:self];
    [self.email setDelegate:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}




- (IBAction)joinPressed:(id)sender {
    
    NSString *parse_username = self.username.text;
    NSString *parse_email = self.email.text;
    NSString *parse_password = self.password.text;
    
    
    
    // when all informations are not filled
    if ([parse_email length] == 0 || [parse_password length] == 0 || [parse_username length] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"Please fill all the informations!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        
        [alertView show];
    }
    else
    {
    
        
        // adding a new user to Parse
        
        PFUser *user = [PFUser user];
        user.username = parse_username;
        user.password = parse_password;
        user.email = parse_email;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error)
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Username already taken!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                [alertView show];
            }
            else
            {
                appDelegate.currentUser = user;
                appDelegate.friendList = nil;
                appDelegate.currentUserName = parse_username;
                
                // adding a separate class for user_recipe
                NSString *recipeClass = @"_Recipe";
                NSString *addingRecipeClass = [appDelegate.currentUserName stringByAppendingString:recipeClass];
                NSString *addingFavoriteClass = [appDelegate.currentUserName stringByAppendingString:@"_Bowl"];
                
                PFObject *recipeParseClass = [PFObject objectWithClassName:addingRecipeClass];
                
                [recipeParseClass saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (error)
                    {
                        NSLog(@"error: %@", error);
                    }
                    else
                    {
                        PFObject *recipeBowl = [PFObject objectWithClassName:addingFavoriteClass];
                        [recipeBowl saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            if (error)
                            {
                                NSLog(@"%@", error);
                            }
                            else
                            {
                                [self.navigationController popToRootViewControllerAnimated:YES];
                            }
                        }];
                        
                    }
                }];
                
            }
        }];
    }
}
@end
