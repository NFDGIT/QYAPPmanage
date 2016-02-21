//
//  QYAppView.h
//  03-应用管理器
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QYAppModel;
@interface QYAppView : UIView

//定义QYAppModel类型的属性，利用model的setter方法来设置子视图的属性
@property(nonatomic, strong) QYAppModel *model;

//声明初始化方法
+(instancetype)appView;

//设置子视图的属性（图片、标题、链接地址）
-(void)setPropertyForAppViewSubviews:(QYAppModel *)appModel;
@end
