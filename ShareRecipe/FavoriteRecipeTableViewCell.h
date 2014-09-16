//
//  FavoriteRecipeTableViewCell.h
//  RecipeBowl
//
//  Created by Jong Yun Lee on 9/16/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteRecipeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *time;

@end
