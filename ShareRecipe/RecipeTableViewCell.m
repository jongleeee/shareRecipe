//
//  RecipeTableViewCell.m
//  RecipeBowl
//
//  Created by Jong Yun Lee on 9/16/14.
//  Copyright (c) 2014 HeapStack. All rights reserved.
//

#import "RecipeTableViewCell.h"

@implementation RecipeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
