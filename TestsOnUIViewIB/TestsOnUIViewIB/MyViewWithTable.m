//
//  MyTableView.m
//  TestsOnUIViewIB
//
//  Created by SeoGiwon on 01/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

#import "MyViewWithTable.h"

@implementation MyViewWithTable


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self commonInit];
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self commonInit];
    return self;
}

- (void)commonInit {
    [[NSBundle mainBundle] loadNibNamed:@"MyViewWithTable" owner:self options:nil];
    [self addSubview:self.contentView];
    
    [self.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [[self.contentView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
    [[self.contentView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
    [[self.contentView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
    [[self.contentView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
}

@end
