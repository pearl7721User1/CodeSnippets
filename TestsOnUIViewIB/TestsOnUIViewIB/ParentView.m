//
//  ParentView.m
//  TestsOnUIViewIB
//
//  Created by SeoGiwon on 01/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

#import "ParentView.h"
#import "MyViewWithTable.h"

@interface ParentView () <UITableViewDataSource>

@property CGFloat myViewWithTableHeight;

@property (nonatomic, strong) UIButton* expandButton;
@property (nonatomic, strong) UIButton* resetButton;

@end

@implementation ParentView

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
    
    self.navigationView = [UIView new];
    self.navigationView.backgroundColor = UIColor.greenColor;
    [self addSubview:self.navigationView];
    
    self.myViewWithTable = [MyViewWithTable new];
    self.myViewWithTable.tableView.dataSource = self;
    self.myViewWithTableHeight = 120;
    [self addSubview:self.myViewWithTable];

    self.jogShuttleView = [UIView new];
    self.jogShuttleView.backgroundColor = UIColor.blueColor;
    [self addSubview:self.jogShuttleView];
    
    
    [self configureNavigationView];
    
    self.clipsToBounds = YES;
}

- (void)layoutSubviews {
    
    // set layout for subviews
    self.navigationView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)/4.0);
    
    
    self.myViewWithTable.frame = CGRectMake(0, CGRectGetMaxY(self.navigationView.frame), CGRectGetWidth(self.bounds), self.myViewWithTableHeight);
    
    
    CGFloat jogShuttleViewHeight = CGRectGetHeight(self.bounds) - CGRectGetHeight(self.navigationView.frame) - CGRectGetHeight(self.myViewWithTable.frame);
    if (jogShuttleViewHeight <= 0) {
        jogShuttleViewHeight = 0;
    }
    
    self.jogShuttleView.frame = CGRectMake(0, CGRectGetMaxY(self.myViewWithTable.frame), CGRectGetWidth(self.bounds), jogShuttleViewHeight);
    
    
    // set layout for navigation subviews
    
    [_expandButton setCenter:CGPointMake(CGRectGetMidX(_navigationView.bounds) - 50, CGRectGetMidY(_navigationView.bounds))];
    [_resetButton setCenter:CGPointMake(CGRectGetMidX(_navigationView.bounds) + 50, CGRectGetMidY(_navigationView.bounds))];
}

- (void)configureNavigationView {
    _expandButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_expandButton addTarget:self action:@selector(expandButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_expandButton setTitle:@"expand" forState:UIControlStateNormal];
    [_expandButton sizeToFit];
    
    _resetButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_resetButton addTarget:self action:@selector(resetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_resetButton setTitle:@"reset" forState:UIControlStateNormal];
    [_resetButton sizeToFit];
    
    [self.navigationView addSubview:_expandButton];
    [self.navigationView addSubview:_resetButton];
}

- (void)expandButtonAction {
    self.myViewWithTableHeight = 160;
    [self layoutSubviews];
}

- (void)resetButtonAction {
    self.myViewWithTableHeight = 120;
    [self layoutSubviews];
}

// tableview data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%dth cell", indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

@end
