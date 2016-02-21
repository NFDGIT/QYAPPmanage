//
//  QYAppView.m
//  03-应用管理器
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYAppView.h"
#import "QYAppModel.h"
#import "QYButton.h"
@interface QYAppView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet QYButton *downLoadBtn;

@end

@implementation QYAppView

+(instancetype)appView{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"QYAppView" owner:self options:nil];
    return views.firstObject;
}
//跳转链接地址
- (IBAction)goToDownLoad:(QYButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:sender.linkString]];
}

//设置属性
-(void)setPropertyForAppViewSubviews:(QYAppModel *)appModel{
    //设置imageView的图片
    _imageView.image = [UIImage imageNamed:appModel.icon];
    //设置titleLabel的标题
    _titleLabel.text = appModel.name;
    //downloadBtn的link
    _downLoadBtn.linkString = appModel.link;
}

-(void)setModel:(QYAppModel *)model{
    //自身需要完成的事情
    _model = model;
    
    //额外需要做的事情
    //设置imageView的图片
    _imageView.image = [UIImage imageNamed:model.icon];
    //设置titleLabel的标题
    _titleLabel.text = model.name;
    //downloadBtn的link
    _downLoadBtn.linkString = model.link;
}

@end
