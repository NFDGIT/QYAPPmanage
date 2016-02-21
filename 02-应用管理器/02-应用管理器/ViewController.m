//
//  ViewController.m
//  02-应用管理器
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYButton.h"

#define  QYScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

-(NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _apps = [NSArray arrayWithContentsOfFile:path];
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //总列数
    int column = 4;
    
    //appView的大小
    CGFloat appViewW = 80;
    CGFloat appViewH = 90;
    
    //两个相邻的appView间距
    CGFloat spaceX = (QYScreenW - appViewW * column) / (column + 1);
    CGFloat spaceY = 30;
    
    for (int i = 0; i < self.apps.count; i++) {
        //当前appView的行和列
        int row = i / column;
        int currentColumn = i % column;
        
        CGFloat appViewX = spaceX * (currentColumn + 1) + appViewW * currentColumn;
        CGFloat appViewY = spaceY * (row + 1) + appViewH * row;
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"AppView" owner:self options:nil];
        UIView *appView = views[0];
        appView.frame = CGRectMake(appViewX, appViewY, appViewW, appViewH);
        [self.view addSubview:appView];
        
        NSDictionary *dict = self.apps[i];
        //通过tag值找到icon
        UIImageView *icon = [appView viewWithTag:101];
        icon.image = [UIImage imageNamed:dict[@"icon"]];
        //通过tag值找title
        UILabel *title = [appView viewWithTag:102];
        title.text = dict[@"name"];
        //通过tag值找到btn
        QYButton *downLoadBtn = [appView viewWithTag:103];
        //添加点击事件
        [downLoadBtn addTarget:self action:@selector(downLoad:) forControlEvents:UIControlEventTouchUpInside];
        downLoadBtn.linkString = dict[@"link"];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)downLoad:(QYButton *)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sender.linkString]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
