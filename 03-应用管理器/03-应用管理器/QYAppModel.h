//
//  QYAppModel.h
//  03-应用管理器
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYAppModel : NSObject
//声明属性（建议  模型中的属性名称要跟字典中的键名一致）
@property (nonatomic, strong) NSString *icon;       //应用程序图标
@property (nonatomic, strong) NSString *name;       //应用程序的标题
@property (nonatomic, strong) NSString *link;       //应用程序的下载地址

//声明初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)appModelWithDictionary:(NSDictionary *)dict;
@end
