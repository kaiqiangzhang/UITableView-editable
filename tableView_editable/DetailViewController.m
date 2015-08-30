//
//  DetailViewController.m
//  tableView_editable
//
//  Created by kris on 15/8/1.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController{
    AppDelegate* _appDelegate;
    NSUInteger _rowNo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewWillAppear:(BOOL)animated
{
    _appDelegate=[UIApplication sharedApplication].delegate;
    _rowNo=self.editingIndePath.row;
    self.nameField.text=_appDelegate.books[_rowNo];
    self.detailField.text=_appDelegate.details[_rowNo];
}

-(void)tapped:(id)sender
{
    //替换_appDelegate的Books集合中指定索引处的元素
    [_appDelegate.books replaceObjectAtIndex:_rowNo withObject:self.nameField.text];
    [_appDelegate.details replaceObjectAtIndex:_rowNo withObject:self.detailField.text];
    ViewController* listViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"list"];
    _appDelegate.window.rootViewController=listViewController;
}

-(void)finished:(id)sender
{
    [sender resignFirstResponder];
}
@end
