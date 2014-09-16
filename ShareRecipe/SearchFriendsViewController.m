//
//  SearchFriendsViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/10/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "SearchFriendsViewController.h"
#import <Parse/Parse.h>

@interface SearchFriendsViewController ()

@end

@implementation SearchFriendsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    appDelegate = [[UIApplication sharedApplication] delegate];
}



- (IBAction)findPressed:(id)sender {
    
    NSString *friendsUsername = self.username.text;
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:friendsUsername];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (error)
        {
            NSLog(@"%@", error);
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ooops!" message:@"Not found!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [alertView show];
        }
        else
        {
            PFRelation *relation = [appDelegate.currentUser relationforKey:@"friendsRelation"];
            
            [relation addObject:object];
            NSLog(@"addddding: %@", object);
            NSLog(@"adding: %@", appDelegate.currentUser[@"friendsRelation"]);

            
            [appDelegate.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (error)
                {
                    NSLog(@"%@", error);
                }
                else
                {
//                    PFRelation *userFriendRelation = object[@"friendsRelation"];
//                    [userFriendRelation addObject:appDelegate.currentUser];
//                    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                        if (error)
//                        {
//                            NSLog(@"%@", error);
//                        }
//                        else
//                        {
//                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Successfully added!" message:nil delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//                            [alertView show];
//                            [self.navigationController popToRootViewControllerAnimated:YES];
//                        }
//                    }];
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }
            }];
        
        }
    }];
}
@end
