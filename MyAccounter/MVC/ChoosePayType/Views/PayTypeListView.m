//
//  PayTypeListView.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/20.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import "PayTypeListView.h"
#import "YLButton.h"

@implementation PayTypeListView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupUI];
}


- (void)setupUI
{
    @weakify(self);
    
    self.backgroundColor = [UIColor colorWithRGB:0x6E808E];
    
    NSArray *arr = [PayTypeListView readJSON2Array];
    
    
    for (NSInteger i=0; i<17; i++) {
        YLButton *btn = [YLButton buttonWithType:UIButtonTypeRoundedRect];
        [self addSubview:btn];
        
        [btn mas_remakeConstraints:^(MASConstraintMaker *make) {
            CGFloat w = weak_self.size.width/6;
            make.height.width.mas_equalTo(w);
            make.top.offset(w*(i/6));
            make.left.offset(w*(i%6));
        }];
        
        if (i == self.payTypeIndex) {
            btn.backgroundColor = [UIColor colorWithRGB:0x448EB2];
            self.payType = arr[i];
        }
        
        
        btn.tag = i;
        NSString *btnString = @"";
        btnString = @(i+1).stringValue;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:10];
        
        
        [btn addBlockForControlEvents:UIControlEventTouchDown block:^(UIButton *sender) {
            for (UIView *vi in weak_self.subviews) {
                if ([vi isKindOfClass:[UIButton class]]) {
                    vi.backgroundColor = [UIColor colorWithRGB:0x6E808E];
                }
            }
            
            weak_self.payTypeIndex = sender.tag;
            weak_self.payType = arr[sender.tag];
            
            sender.backgroundColor = [UIColor colorWithRGB:0x448EB2];
            
            if (weak_self.delegate) {
                [weak_self.delegate PayTypeListViewClick:sender index:i];
            }
        }];
    }
}


#pragma mark tools
+ (NSArray *)readJSON2Array
{
    NSString *jsonStr = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PayTypeList" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *arr = [jsonStr jsonValueDecoded];
    
    return arr;
}



@end
