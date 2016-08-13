//
//  TableViewController.m
//  tableViewPullWebView
//
//  Created by 黄启山 on 16/8/12.
//  Copyright © 2016年 黄启山. All rights reserved.
//

#define IPHONE_W ([UIScreen mainScreen].bounds.size.width)
#define IPHONE_H ([UIScreen mainScreen].bounds.size.height)

#import "TableViewController.h"
#import "MyWebViewController.h"

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableV;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第一页";
    [self.view addSubview:self.tableV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- UITableView DataSource && Delegate
//返回表格分区行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 13;
}
//定制单元格内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%ld",indexPath.section,indexPath.row];
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
    float y;
    if (13 * 44 + 64 - IPHONE_H < 0) {//注意这里的计算是行数乘以行高减去屏幕的高度再加上导航栏的高度(这里是没有满屏的情况)
        y = 0;
    }
    else{//这里是满屏的情况
        y = 13 * 44 - IPHONE_H + 20 + 64;
    }
    if (scrollView.contentOffset.y > y) {
        
        [UIView animateWithDuration:0.8 animations:^{
            MyWebViewController *webVC = [[MyWebViewController alloc]init];
            UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:webVC];
            [self presentViewController:navc animated:YES completion:nil];
        }];
    }
    NSLog(@"---%.2f",scrollView.contentOffset.y);
}

@end
