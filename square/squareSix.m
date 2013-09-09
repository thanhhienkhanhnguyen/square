//
//  squareSix.m
//  square
//
//  Created by user on 12-3-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "squareSix.h"

@implementation squareSix

-(id)init
{
    //Hinh chu __|
    self = [super init];
    if (self) {
        case1.x = 1;
        case1.y = 0;
        case2.x = 1;
        case2.y = 1;
        case3.x = 1;
        case3.y = 2;
        case4.x = 0;
        case4.y = 2;
        state = 1;

    }
    return self;    
}

//Rotate Square
-(void)squareRound
{
    if (state == 1) {
        [self setButtonState:YES];
        if ([self beyondBounds:case2.x-1 :case1.y]
            || [self beyondBounds:case1.x+1 :case1.y+2]) {
            [self setButtonState:NO];
            return;
        }
        state = 2;
        case2.x -= 1;
        case1.y += 2;
        case1.x += 1;
        
        [self setButtonState:NO];
        
        
        return;
        
    } else if (state == 2) {
        [self setButtonState:YES];
        
        if ([self beyondBounds:case1.x-2 :case1.y-2]
            || [self beyondBounds:case3.x :case3.y-2]) {
            [self setButtonState:NO];
            return;
        }
        state = 3;
        case1.x -= 2;
        case1.y -= 2;
        case3.y -= 2;
        
        
        [self setButtonState:NO];
        
        
        return;
        
    } else if (state == 3) {
        [self setButtonState:YES];
        
        if ([self beyondBounds:case3.x :case3.y+1]
            || [self beyondBounds:case1.x+2 :case1.y+1]
            || [self beyondBounds:case4.x+2 :case4.y]) {
            [self setButtonState:NO];
            return;
        }
        state = 4;
        
        case3.y += 1;
        case1.x += 2;
        case1.y += 1;
        
        case4.x += 2;
        
        
        [self setButtonState:NO];
        
        
        return;
        
    } else if (state == 4) {
        [self setButtonState:YES];
        
        if ([self beyondBounds:case1.x-1 :case1.y-1]
            || [self beyondBounds:case2.x+1 :case2.y]
            || [self beyondBounds:case3.x :case3.y+1]
            || [self beyondBounds:case4.x-2 :case3.y]) {
            [self setButtonState:NO];
            return;
        }
        state = 1;
        case1.x -= 1;
        case1.y -= 1;
        
        case2.x += 1;
        
        case3.y += 1;
        
        case4.x -= 2;
        
        
        [self setButtonState:NO];
        
        
        return;
        
    }
    
    
}

-(void)flipVertical
{
    
}
@end
