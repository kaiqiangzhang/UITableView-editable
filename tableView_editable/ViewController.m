//
//  ViewController.m
//  tableView_editable
//
//  Created by kris on 15/8/1.
//  Copyright (c) 2015年 kris. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController{
    AppDelegate* _appDelegate;//需要导入AppDelegate.h
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //为UITableView设置dataSource和delegate
    self.editTableView.dataSource=self;
    self.editTableView.delegate=self;
    
    //获取delegate对象
    _appDelegate = [UIApplication sharedApplication].delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [self.editTableView reloadData];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* cellId=@"cellId";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    NSInteger currentRowNo=indexPath.row;
    cell.layer.cornerRadius=12;
    cell.layer.masksToBounds=YES;
    cell.imageView.image=[UIImage imageNamed:@"ic_gray.png"];
    cell.imageView.highlightedImage=[UIImage imageNamed:@"ic_highlight.png"];
    cell.textLabel.text=_appDelegate.books[currentRowNo];
    cell.detailTextLabel.text=_appDelegate.details[currentRowNo];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _appDelegate.books.count;
}

//当用户选中指定的表格行时将会激发该委托方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController* detialViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    //保存用户正在编辑的表格行对应的NSIndexPath
    detialViewController.editingIndePath=indexPath;
    _appDelegate.window.rootViewController=detialViewController;
}



@end
