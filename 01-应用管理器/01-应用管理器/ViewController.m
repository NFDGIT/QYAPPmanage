//
//  ViewController.m
//  01-应用管理器
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYButton.h"
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic, strong) NSArray *apps;
@end

@implementation ViewController

//懒加载apps
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
    //appView的宽高
    CGFloat appViewW = 80;
    CGFloat appViewH = 90;
    
    //两个相邻appView之间的间距
    CGFloat appViewSpaceX = (QYScreenW - appViewW * column) / (column + 1);
    CGFloat appViewSpaceY = 30;
    
    //注意使用通过懒加载方式初始化的apps的时候，必须使用self.apps
    for (int i = 0; i < self.apps.count; i++) {
        //获取每个应用程序的行和列
        int appViewRow = i / column;
        int appViewColumn = i % column;
        
        //计算每个应用的位置
        CGFloat appViewX = appViewSpaceX * (appViewColumn + 1) + appViewW * appViewColumn;
        CGFloat appViewY = appViewSpaceY * (appViewRow + 1) + appViewH * appViewRow;
        
        //添加appView
        UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(appViewX, appViewY, appViewW, appViewH)];
        [self.view addSubview:appView];
        //appView.backgroundColor = [UIColor redColor];
        
        //添加子视图
        //提取当前appView对应的字典
        NSDictionary *dict = self.apps[i];
        //添加图标
        CGFloat iconW = 40;
        CGFloat iconH = 40;
        CGFloat iconX = (appViewW - iconW) / 2;
        CGFloat iconY = 0;
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(iconX, iconY, iconW, iconH)];
        [appView addSubview:icon];
        NSString *imageName = dict[@"icon"];
        icon.image = [UIImage imageNamed:imageName];
        //添加标题
        CGFloat titleW = 80;
        CGFloat titleH = 20;
        CGFloat titleX = 0;
        CGFloat titleY = iconH + iconY;
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(titleX, titleY, titleW, titleH)];
        [appView addSubview:title];
        title.text = dict[@"name"];
        title.font = [UIFont systemFontOfSize:12.0];
        title.textAlignment = NSTextAlignmentCenter;
        
        //添加下载按钮
        CGFloat btnW = 60;
        CGFloat btnH = 20;
        CGFloat btnX = (appViewW - btnW) / 2;
        CGFloat btnY = titleH + titleY;
        QYButton *downLoadBtn = [QYButton buttonWithType:UIButtonTypeCustom];
        [appView addSubview:downLoadBtn];
        downLoadBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [downLoadBtn setTitle:@"下载" forState:UIControlStateNormal];
        [downLoadBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [downLoadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
        [downLoadBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
        downLoadBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
        [downLoadBtn addTarget:self action:@selector(downLoad:) forControlEvents:UIControlEventTouchUpInside];
#if 0
        downLoadBtn.tag = i + 100;
        
#else
        downLoadBtn.linkString = dict[@"link"];
#endif
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)downLoad:(QYButton *)sender {
#if 0
    NSDictionary *dict = self.apps[sender.tag - 100];
    NSString *linkString = dict[@"link"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:linkString]];
#endif
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sender.linkString]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
