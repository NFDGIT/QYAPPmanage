//
//  QYAppModel.m
//  03-应用管理器
//
//  Created by qingyun on 16/2/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYAppModel.h"

@implementation QYAppModel

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        //对属性赋值
#if 0
        _icon = dict[@"icon"];
        _name = dict[@"name"];
        _link = dict[@"link"];
#else
        //使用kvc把字典中的数据直接灌入模型属性
        [self setValuesForKeysWithDictionary:dict];
#endif
    }
    return self;
}

+(instancetype)appModelWithDictionary:(NSDictionary *)dict{
    //在类方法中self指当前类（self 相当于 QYAppModel）
    return [[self alloc] initWithDictionary:dict];
}

@end
