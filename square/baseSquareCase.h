//
//  squareCase.h
//  square
//
//  Created by user on 12-2-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "squareDelegate.h"

typedef struct Square {
    NSInteger x;
    NSInteger y;
}__squre;

@interface baseSquareCase : NSObject
{
    __squre case1, case2,case3,case4;
    NSUInteger state;
    id<squareDelegate>delegate;

}
@property (nonatomic, assign) __squre case1, case2,case3,case4;
@property (nonatomic, retain) id<squareDelegate>delegate;

;
-(void)squareMoveLeft;
-(void)squareMoveRight;
-(BOOL)beyondBounds:(NSInteger)x:(NSInteger)y;
-(void)squareMoveDown;
-(void)setButtonState:(BOOL)state;
-(void)squareRound;

@end
