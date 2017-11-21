//
//  NumKeyboardView.h
//  MyAccounter
//
//  Created by AceWei on 2017/11/20.
//  Copyright © 2017年 AceWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumKeyboardViewDelegate <NSObject>

- (void)NumKeyboardViewClickKeyboard:(NSString *)value;
- (void)NumKeyboardViewClickSure;

@end

@interface NumKeyboardView : UIView

@property (nonatomic,weak) id<NumKeyboardViewDelegate> delegate;

@end
