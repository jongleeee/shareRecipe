//
//  FriendsTableViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/10/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface FriendsTableViewController : UITableViewController {
    AppDelegate *appDelegate;
}

@property (strong, nonatomic) NSArray *friendsList;
@property (nonatomic, strong) PFUser *selectedUser;


@end
