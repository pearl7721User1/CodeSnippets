//
//  ParentView.h
//  TestsOnUIViewIB
//
//  Created by SeoGiwon on 01/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewWithTable.h"

@interface ParentView : UIView

@property (nonatomic, strong) UIView* navigationView;
@property (nonatomic, strong) MyViewWithTable* myViewWithTable;
@property (nonatomic, strong) UIView* jogShuttleView;

@end
