//
//  squareSeven.m
//  square
//
//  Created by Moutiain Lion on 9/5/13.
//
//

#import "squareSeven.h"

@implementation squareSeven
-(id)init
{
    //Hinh chu T
    self = [super init];
    if (self) {
        case1.x = 0;
        case1.y = 0;
        case2.x = 0;
        case2.y = 1;
        case3.x = 0;
        case3.y = 2;
        case4.x = 1;
        case4.y = 1;
        state = 1;
        
    }
    return self;
}
-(void)squareRound
{
    if (state == 1) {
        [self setButtonState:YES];
        if ([self beyondBounds:case3.x +2 :case3.y  -1]
            || [self beyondBounds:case1.x+1 :case1.y]) {
            [self setButtonState:NO];
            return;
        }
        state = 2;
//        case2.x -= 1;
//        case1.y += 2;
//        case1.x += 1;
        
        case1.x += 1;
        case3.x += 2;
        case3.y += -1;
        
        [self setButtonState:NO];
        
        
        return;
        
    }else if (state == 2){
        
    }else if (state == 3) {
        
    }else if (state == 4){
        
    }
}
@end
