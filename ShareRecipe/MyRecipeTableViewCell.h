//
//  MyRecipeTableViewCell.h
//  RecipeBowl
//
//  Created by Jong Yun Lee on 9/16/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyRecipeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *recipeImage;
@property (strong, nonatomic) IBOutlet UILabel *recipeName;
@property (strong, nonatomic) IBOutlet UILabel *recipeTime;

@end
