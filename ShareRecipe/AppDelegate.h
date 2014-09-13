//
//  AppDelegate.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/2/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@property (nonatomic, strong) PFUser *currentUser;
@property (nonatomic, strong) NSString *currentUserName;
@property (nonatomic, strong) PFQuery *friendList;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
