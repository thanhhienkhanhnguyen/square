//
//  squareCase.m
//  square
//
//  Created by user on 12-2-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "baseSquareCase.h"
#import "squareDelegate.h"
#import "AppDelegate.h"

@implementation baseSquareCase
@synthesize case1, case2,case3,case4;
@synthesize delegate;

-(void)squareRound
{

}
-(BOOL)getButtonShowState:(NSInteger)x:(NSInteger)y
{
    rootViewController * rvc = [rootViewController sharedRootViewController];
    UIButton * button = (UIButton *)[rvc.view viewWithTag:x + y * 10 + 100];
    if (button) {
        return button.hidden;
    } else {
        return NO;
    }
        
}
-(BOOL)beyondBounds:(NSInteger)x:(NSInteger)y
{
    if (x < 0 || x >= 10 || y > 20 || ![self getButtonShowState:x :y]) {
        return YES;
    } 
    else
        return NO;
}
-(void)__setButtonState:(NSInteger)tag:(BOOL)states
{
    rootViewController * rvc = [rootViewController sharedRootViewController];
    UIButton * button = (UIButton *)[rvc.view viewWithTag:tag];
    if (button) {
        button.hidden = states;
    }
}
-(void)setButtonState:(BOOL)states
{
    [self __setButtonState:case1.x + case1.y * 10 + 100:states];
    [self __setButtonState:case2.x + case2.y * 10 + 100:states];
    [self __setButtonState:case3.x + case3.y * 10 + 100:states];
    [self __setButtonState:case4.x + case4.y * 10 + 100:states];
}


-(void)squareMoveRight
{
    [self setButtonState:YES];
    if ([self beyondBounds:case1.x+1 :case1.y]
        || [self beyondBounds:case2.x+1 :case2.y]
        || [self beyondBounds:case3.x+1 :case3.y]
        || [self beyondBounds:case4.x+1 :case4.y]) {
        [self setButtonState:NO];
        return;
    }
    ++case1.x;
    ++case2.x;
    ++case3.x;
    ++case4.x;
    [self setButtonState:NO];
    
    return;
}

-(void)squareMoveLeft
{
    [self setButtonState:YES];
    if ([self beyondBounds:case1.x-1 :case1.y]
        || [self beyondBounds:case2.x-1 :case2.y]
        || [self beyondBounds:case3.x-1 :case3.y]
        || [self beyondBounds:case4.x-1 :case4.y]) {
        [self setButtonState:NO];
        return;
    }
    --case1.x;
    --case2.x;
    --case3.x;
    --case4.x;
    [self setButtonState:NO];
    
    return;

}

-(void)squareMoveDown;
{
    [self setButtonState:YES];
    if ([self beyondBounds:case1.x :case1.y+1]
        || [self beyondBounds:case2.x :case2.y+1]
        || [self beyondBounds:case3.x :case3.y+1]
        || [self beyondBounds:case4.x :case4.y+1]) {
        [self setButtonState:NO];
        [delegate squareDownToEnd];
        return;
        
    }
        ++case1.y;
        ++case2.y;
        ++case3.y;
        ++case4.y;
        [self setButtonState:NO];

        return;
}
@end
