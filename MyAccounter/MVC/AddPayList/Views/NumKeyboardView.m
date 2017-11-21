//
//  NumKeyboardView.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/20.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import "NumKeyboardView.h"

@implementation NumKeyboardView


- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 获取到约束后的控件frame
    [self setupUI];
}


- (void)setupUI
{
    @weakify(self);
    self.backgroundColor = [UIColor whiteColor];
    
    for (NSInteger i=0; i<12; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:btn];
        
        [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGFloat h = weak_self.size.height/4;
            CGFloat w = weak_self.size.width/4;
            make.height.mas_equalTo(h);
            make.width.mas_equalTo(w);
            make.top.offset(h*(i/3));
            make.left.offset(w*(i%3));
        }];
        
        
        NSString *btnString = @"";
        switch (i) {
            case 9:
                btnString = @".";
                btn.backgroundColor = [UIColor colorWithRGB:0xebebeb];
                break;
                
            case 10:
                btnString = @"0";
                break;
                
            case 11:
                btnString = @"X";
                btn.backgroundColor = [UIColor colorWithRGB:0xebebeb];
                break;
                
            default:
                btnString = @(i+1).stringValue;
                break;
        }
        
        
        [btn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            if (self.delegate) {
                [self.delegate NumKeyboardViewClickKeyboard:btnString];
            }
        }];
        
        
        [btn setTitle:btnString forState:UIControlStateNormal];
    }
    
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:sureBtn];
    
    [sureBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.offset(0);
        make.width.mas_equalTo(weak_self.size.width/4);
    }];
    
    [sureBtn setTitle:@"完成" forState:UIControlStateNormal];
    
    [sureBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        if (self.delegate) {
            [self.delegate NumKeyboardViewClickSure];
        }
    }];
}

@end
