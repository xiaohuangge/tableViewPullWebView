//
//  MyWebViewController.m
//  tableViewPullWebView
//
//  Created by 黄启山 on 16/8/12.
//  Copyright © 2016年 黄启山. All rights reserved.
//

#define IPHONE_W ([UIScreen mainScreen].bounds.size.width)
#define IPHONE_H ([UIScreen mainScreen].bounds.size.height)

#import "MyWebViewController.h"
#import "TableViewController.h"

@interface MyWebViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableV;

@end

@implementation MyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第二页";
    [self.view addSubview:self.tableV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//返回表格分区行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
//定制单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"12121212121";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableV deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableView *)tableV
{
    if (_tableV == nil)
    {
        _tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, IPHONE_W, IPHONE_H) style:UITableViewStylePlain];
        _tableV.delegate = self;
        _tableV.dataSource = self;
    }
    return _tableV;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y < -135) {
        
        [UIView animateWithDuration:0.8 animations:^{
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }
    NSLog(@"---%.2f",scrollView.contentOffset.y);
}

@end
