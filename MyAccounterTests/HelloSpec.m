//
//  HelloSpec.m
//  MyAccounter
//
//  Created by AceWei on 2017/11/16.
//  Copyright 2017年 AceWei. All rights reserved.
//

#import <Kiwi/Kiwi.h>

SPEC_BEGIN(HelloSpec)

describe(@"Team", ^{
    context(@"when newly created", ^{
        it(@"should have a name", ^{
            [[@"hello9" should] equal:@"hello"];
        });
    });
});



SPEC_END
