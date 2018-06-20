//
//  ViewController.m
//  ZJHFoundation
//
//  Created by 曾俊晖 on 2018/1/9.
//  Copyright © 2018年 ZJH. All rights reserved.
//

#import "ViewController.h"
#import "ZJH_TextField.h"

@interface ViewController ()
<
UITableViewDataSource
>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZJH_TextField *textField = [ZJH_TextField new];
    textField.frame = CGRectMake(40, 100, 70, 100);
    textField.isNumber = YES;
    [textField setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:textField];
    
    UITableView *tabelView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tabelView.status = ZJHEmptyDataSetStatusLoading;
    tabelView.separatorStyle = UITableViewCellAccessoryNone;
    tabelView.dataSource = self;
    [self.view addSubview:tabelView];
    [tabelView reloadData];
    
//    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 300, 600)];
    
    
//    [self.view addSubview:scrollView];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
