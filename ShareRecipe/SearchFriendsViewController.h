//
//  SearchFriendsViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/10/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SearchFriendsViewController : UIViewController {
    AppDelegate *appDelegate;
}
@property (strong, nonatomic) IBOutlet UITextField *username;
- (IBAction)findPressed:(id)sender;

@end
