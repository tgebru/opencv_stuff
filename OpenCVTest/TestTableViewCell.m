//
//  TestTableViewCell.m
//  OpenCVTests
//
//  Created by Shirmung Bielefeld on 7/21/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "TestTableViewCell.h"

@implementation TestTableViewCell

@synthesize nameLabel, lightSwitch;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // Initialization code
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
