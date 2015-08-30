//
//  DetailViewController.h
//  tableView_editable
//
//  Created by kris on 15/8/1.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *detailField;
@property (strong, nonatomic) NSIndexPath* editingIndePath;

-(IBAction)tapped:(id)sender;
-(IBAction)finished:(id)sender;

@end
