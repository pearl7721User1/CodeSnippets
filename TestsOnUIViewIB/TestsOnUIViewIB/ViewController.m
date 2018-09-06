//
//  ViewController.m
//  TestsOnUIViewIB
//
//  Created by SeoGiwon on 01/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

#import "ViewController.h"
#import "ParentView.h"

@interface ViewController ()

@property (nonatomic, strong) ParentView* parentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.parentView = [ParentView new];
    [self.view addSubview:self.parentView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.parentView.frame = CGRectMake(50, 100, 200, 300);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
