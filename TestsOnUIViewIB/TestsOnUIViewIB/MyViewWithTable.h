//
//  MyTableView.h
//  TestsOnUIViewIB
//
//  Created by SeoGiwon on 01/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewWithTable : UIView

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
