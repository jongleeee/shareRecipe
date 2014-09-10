//
//  FriendsTableViewController.m
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/10/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "FriendsTableViewController.h"

@interface FriendsTableViewController ()

@end

@implementation FriendsTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}






@end
