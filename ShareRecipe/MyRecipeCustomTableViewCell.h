//
//  MyRecipeCustomTableViewCell.h
//  ShareRecipe
//
//  Created by Jong Yun Lee on 9/12/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyRecipeCustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *recipeName;
@property (strong, nonatomic) IBOutlet UILabel *recipeTime;
@property (strong, nonatomic) IBOutlet UIImageView *recipePicture;

@end
