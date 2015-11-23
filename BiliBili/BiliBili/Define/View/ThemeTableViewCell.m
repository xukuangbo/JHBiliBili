//
//  ThemeTableViewCell.m
//  BiliBili
//
//  Created by JimHuang on 15/11/23.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ThemeTableViewCell.h"

@implementation ThemeTableViewCell
- (instancetype)initWithTitle:(NSString*)title reuseIdentifier:(NSString*)reuseIdentifier{
    if (self = [super initWithStyle:0 reuseIdentifier:reuseIdentifier]) {
        __weak typeof(self)weakObj = self;
        
        UIView* v = [[UIView alloc] init];
        v.backgroundColor = [[ColorManager shareColorManager] theme:title colorWithString:@"themeColor"];
        v.layer.cornerRadius = 8;
        v.layer.masksToBounds = YES;
        [self addSubview: v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(weakObj.mas_centerY);
            make.left.mas_offset(10);
            make.width.height.mas_equalTo(16);
        }];

        UILabel* label = [[UILabel alloc] init];
        label.text = title;
        if (![title isEqualToString:@"夜间模式"]) {
            label.textColor = [[ColorManager shareColorManager] theme:title colorWithString:@"themeColor"];
        }else{
            label.textColor = [[ColorManager shareColorManager] theme:title colorWithString:@"textColor"];
        }
        label.font = [UIFont systemFontOfSize: 14];
        [self addSubview: label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weakObj);
            make.left.equalTo(v.mas_right).mas_offset(10);
        }];
    }
    return self;
}

@end
