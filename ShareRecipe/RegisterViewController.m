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
    
    
  
}





- (IBAction)joinPressed:(id)sender {
    
    NSString *parse_username = self.username.text;
    NSString *parse_email = self.email.text;
    NSString *parse_password = self.password.text;
    
    if ([parse_email length] == 0 || [parse_password length] == 0 || [parse_username length] == 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"Please fill all the informations!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        
        [alertView show];
    }
    else
    {
    
        
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
        }];
    }
}
@end
