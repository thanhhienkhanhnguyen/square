//
//  rootViewController.h
//  square
//
//  Created by user on 12-3-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "baseSquareCase.h"
#import "squareDelegate.h"

@interface rootViewController : UIViewController <squareDelegate>{
    UIView * baseView;
    baseSquareCase * squreCase, * squreCase2;
    UIButton * beginButton;
    UILabel * scoreLabel;
    UILabel * levelLabel;
    NSUInteger score, level;
    
    CGPoint startPoint;
    CGPoint endPoint;
    BOOL update;
    
}

@property(nonatomic,retain) UIView * baseView;
@property(nonatomic,retain) baseSquareCase * squreCase,  * squreCase2;
+(id)sharedRootViewController;


@end
