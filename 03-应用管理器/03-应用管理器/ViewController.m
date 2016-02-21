//
//  ViewController.m
//  03-应用管理器
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYAppModel.h"
#import "QYAppView.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

//懒加载 apps
-(NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        //声明可变的数组，存放转化后的model
        NSMutableArray *appModels = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYAppModel *app = [QYAppModel appModelWithDictionary:dict];
            [appModels addObject:app];
        }
        _apps = appModels;
    }
    return _apps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //总列数
    int totalColumn = 4;
    //appView的宽高
    CGFloat appViewW = 80;
    CGFloat appViewH = 90;
    //两个相邻appView之间的间隔
    CGFloat spaceX = (QYScreenW - appViewW * totalColumn) / (totalColumn + 1);
    CGFloat spaceY = 30;
    
    for (int i = 0; i < self.apps.count; i++) {
        //当前应用的列数和行数
        int currentRow = i / totalColumn;
        int currentColumn = i % totalColumn;
        //计算每个appView的位置
        CGFloat appViewX = spaceX * (currentColumn + 1) + appViewW * currentColumn;
        CGFloat appViewY = spaceY * (currentRow + 1) + appViewH * currentRow;
        
        //创建并添加appView
        QYAppView *appView = [QYAppView appView];
        appView.frame = CGRectMake(appViewX, appViewY, appViewW, appViewH);
        [self.view addSubview:appView];
        
        QYAppModel *appModel = self.apps[i];
        //设置子视图属性
        //[appView setPropertyForAppViewSubviews:appModel];
        appView.model = appModel;
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
