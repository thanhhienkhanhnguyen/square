//
//  squareTwo.m
//  square
//
//  Created by user on 12-3-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "squareTwo.h"

@implementation squareTwo


-(id)init
{
    self = [super init];
    if (self) {
        case1.x = 1;
        case1.y = 0;
        case2.x = 1;
        case2.y = 1;
        case3.x = 0;
        case3.y = 1;
        case4.x = 0;
        case4.y = 2;
        state = 1;

    }
    return self;    
}

-(void)squareRound
{
    if (state == 1) {
        [self setButtonState:YES];
        if ([self beyondBounds:case1.x+1 :case1.y+2]
            || [self beyondBounds:case4.x+1 :case4.y]) {
            [self setButtonState:NO];
            return;
        }
        state = 2;
        ++case1.x;
        case1.y += 2;
        ++case4.x;
        [self setButtonState:NO];
        
        
        return;
        
    } else if (state == 2) {
        [self setButtonState:YES];

        if ([self beyondBounds:case1.x-1 :case1.y-2]
            || [self beyondBounds:case4.x-1 :case4.y]) {
            [self setButtonState:NO];
            return;      
        }
        state = 1;
        --case1.x;
        case1.y -= 2;
        --case4.x;
        [self setButtonState:NO];
        
        
        return;
        
    }
}

@end
