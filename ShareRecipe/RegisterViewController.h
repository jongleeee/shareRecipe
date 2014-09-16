//
//  RegisterViewController.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/9/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RegisterViewController : UIViewController <UITextFieldDelegate> {
    AppDelegate *appDelegate;
}
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)joinPressed:(id)sender;

@end
