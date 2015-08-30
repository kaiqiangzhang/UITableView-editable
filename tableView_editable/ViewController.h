//
//  ViewController.h
//  tableView_editable
//
//  Created by kris on 15/8/1.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *editTableView;

@end

