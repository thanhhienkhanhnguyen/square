//
//  rootViewController.m
//  square
//
//  Created by user on 12-3-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "rootViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "squareOne.h"
#import "squareTwo.h"
#import "squareThree.h"
#import "squareFoure.h"
#import "squarefive.h"
#import "squareSix.h"

#define WIDTH 20
static rootViewController * instance;

@implementation rootViewController
@synthesize baseView;
@synthesize squreCase, squreCase2;


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

+(id)sharedRootViewController
{
    if (instance == nil) {
        instance = [[rootViewController alloc] init];
    }
    return instance;
}

-(void)drawLine
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextMoveToPoint(context, 10.0f, 10.0f);
    CGContextAddLineToPoint(context, 20.0f, 20.0f);
    CGContextStrokePath(context);
                                               

}
-(void)createBaseView
{
    baseView = [[UIView alloc] initWithFrame:
                       CGRectMake(20, 30, 210, 410)];
    baseView.backgroundColor = [UIColor blackColor];
    baseView.layer.borderColor = [[UIColor whiteColor] CGColor];
    baseView.layer.borderWidth = 2.0;
    baseView.hidden = YES;

    [self.view addSubview:baseView];
    [baseView release];
    
}

-(void)createSquare
{
    [self createBaseView];
    //button for dropdow
    for (int x = 0; x < 10; x++) {
        for (int y = 0; y < 20; y++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor whiteColor];
            button.frame = CGRectMake(x*WIDTH+25, y*WIDTH+35, WIDTH, WIDTH);
            button.layer.cornerRadius=4.0;
            button.layer.borderWidth=1.0;
            button.layer.borderColor=[[UIColor grayColor] CGColor];
            
            button.enabled = NO;
            button.hidden = YES;
            button.tag = x + y * 10 + 100;
            [self.view addSubview:button];
        }
    }
    //button for 
    for (int x = 0; x < 3; x++) {
        for (int y = 0; y < 4; y++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.backgroundColor = [UIColor whiteColor];
            button.frame = CGRectMake(x*WIDTH+240, y*WIDTH+25, WIDTH, WIDTH);
            button.layer.cornerRadius=4.0;
            button.layer.borderWidth=1.0;
            button.layer.borderColor=[[UIColor grayColor] CGColor];
            
            button.enabled = NO;
            button.hidden = YES;
            button.tag = x + y * 3 + 500;
            [self.view addSubview:button];

        }
    }

}
-(NSUInteger)getCurrentTime
{
    NSDate * startDate = [[NSDate alloc] init];
    NSCalendar * chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | 
    NSSecondCalendarUnit | NSDayCalendarUnit  | 
    NSMonthCalendarUnit | NSYearCalendarUnit;
    
    NSDateComponents * cps = [chineseCalendar components:unitFlags fromDate:startDate];
    [startDate release];
    [chineseCalendar release];
    NSUInteger second = [cps second];
    return second;
}

-(void)createCaseFactoary:(NSUInteger)type
{
    
}

-(void)remindSquare:(baseSquareCase *)square
{
    UIButton * button;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 4; j++) {
            button = (UIButton *)[self.view viewWithTag:i + j*3 + 500];
            button.hidden = YES;
        }
    }
  button = (UIButton *)[self.view viewWithTag:square.case1.x + square.case1.y * 3 +500];
    button.hidden = NO;
    button = (UIButton *)[self.view viewWithTag:square.case2.x + square.case2.y * 3 +500];
    button.hidden = NO;
    button = (UIButton *)[self.view viewWithTag:square.case3.x + square.case3.y * 3 +500];
    button.hidden = NO;
    button = (UIButton *)[self.view viewWithTag:square.case4.x + square.case4.y * 3 +500];
    button.hidden = NO;
}

-(void)createCase
{
   static NSUInteger seconds;
    if (!seconds) {
        seconds = [self getCurrentTime];
        srand(seconds);
    }
    switch (rand()%6) {
        case 0:
            self.squreCase2 = [[squareOne alloc] init];
            break;
        case 1:
            self.squreCase2 = [[squareTwo alloc] init];
            break;
        case 2:
            self.squreCase2 = [[squareThree alloc] init];
            break;
        case 3:
            self.squreCase2 = [[squareFoure alloc] init];
            break;
        case 4:
            self.squreCase2 = [[squarefive alloc] init];
            break;
        case 5:
            self.squreCase2 = [[squareSix alloc] init];
            break;
        default:
            break;
    }
    [self remindSquare:squreCase2];
    squreCase2.delegate = self;
    [squreCase2 release];
}


-(void)doMainSquareMoveDown
{
    @synchronized(squreCase) {
        update = NO;
        [squreCase squareMoveDown];
        [squreCase squareMoveDown];
        [squreCase squareMoveDown];
    }
}
-(void)fun
{
    while (1) {
        
        [NSThread sleepForTimeInterval:1.0 - (score/200) * 0.05];
        [self performSelectorOnMainThread:@selector(doMainSquareMoveDown) withObject:nil waitUntilDone:YES];
    }

}

-(void)__squareMoveDown
{
    if (!update) {
        [squreCase squareMoveDown];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    @synchronized(squreCase) {
        UITouch * touch = [touches anyObject];
        endPoint = [touch locationInView:self.view];
        if (endPoint.x - startPoint.x >= 20 && endPoint.y - startPoint.y < 80) {
            for (int i = 1; i < (endPoint.x - startPoint.x) / 20; i++) {
                [squreCase squareMoveRight];
            }
        } else if (endPoint.x - startPoint.x <= -20) {
            for (int i = 1; i < (startPoint.x - endPoint.x) / 20; i++) {
                [squreCase squareMoveLeft];
            }
        } else if (endPoint.y - startPoint.y > 60) {
            for (int i = 0; i < (endPoint.y - startPoint.y) / 40; i++) {
                [self __squareMoveDown];
                [self __squareMoveDown];
                [self __squareMoveDown];
                [self __squareMoveDown];
                [self __squareMoveDown];
            }
        }
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    if (ifisGameRun == NO)
//        return;
    UITouch * touch = [touches anyObject];
    if ([touch tapCount]%2 == 0 && [touch tapCount] > 1
        && (endPoint.x - startPoint.x) < 6
        && (startPoint.x - endPoint.x) < 6) {
        [squreCase squareRound];
    }
    startPoint = [touch locationInView:self.view];
}-(void)initTimer
{
    [NSThread detachNewThreadSelector:@selector(fun) toTarget:self withObject:nil];
}

-(void)addLable
{
    scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 150, 80, 40)];
    scoreLabel.text = [NSString stringWithFormat:@"s:%d", score];
    levelLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 280, 80, 40)];
    levelLabel.text = [NSString stringWithFormat:@"l:%d", score/200];
//    levelLabel.backgroundColor = [UIColor clearColor];
//    scoreLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:scoreLabel];
    [self.view addSubview:levelLabel];
    [scoreLabel release];
    [levelLabel release];
}

-(void)beginButtonClick
{

    [self addLable];
    for (int x = 0; x < 10; x++) {
        for (int y = 0; y < 20; y++) {
            UIButton * button = (UIButton *)[self.view viewWithTag:x + y * 10 + 100];
            if (button) {
                button.hidden = YES;
            }
        }
    }

    [self createCase];
    self.squreCase = self.squreCase2;
    baseView.hidden = NO;
    beginButton.hidden = YES;
    beginButton.enabled = NO;
    [self createCase];

}
-(void)launchView
{
    beginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    beginButton.frame = CGRectMake(120, 80, 100, 40);
    [beginButton setTitle:@"Play" forState:UIControlStateNormal];
    [beginButton addTarget:self action:@selector(beginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:beginButton];
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    [self createSquare];

     self.view.backgroundColor = [UIColor blackColor];
    [self launchView];
    [self initTimer];

    
    
//    [self drawLine];


}

#pragma mark --
#pragma delegateMethod

-(void)setButtonShowState:(NSInteger)y
{
    for (int i = 0; i < 10; i++) {
        UIButton * button = (UIButton *)[self.view viewWithTag:y*10 + i + 100];
        if (button) {
            button.hidden = YES;
        }
    }
}

-(void)resetButtonPoint:(NSInteger)y
{
    score += 100;
    scoreLabel.text = [NSString stringWithFormat:@"s:%d", score];
    levelLabel.text = [NSString stringWithFormat:@"l:%d", (int)score/200];
    for (int j = y; j >= 0; j--) {
        for (int i = 0; i < 10; i++) {
            UIButton * button = (UIButton *)[self.view viewWithTag:j*10 + i + 100];
            if (button && button.hidden == NO) {
                button.hidden = YES;
                button = (UIButton *)[self.view viewWithTag:(j+1)*10 + i + 100];
                button.hidden = NO;
            }
        }

    }
}

-(BOOL)getButtonShowState:(NSInteger)x:(NSInteger)y
{
    UIButton * button = (UIButton *)[self.view viewWithTag:x + y*10 + 100];
    if (button && button.hidden == NO) {
        return YES;
    } else
        return NO;
}

-(void)deleteButton
{
    BOOL flage;
    for (int y = 19; y >= 0; y--) {
        flage = NO;
        for (int x = 0; x < 10; x++) {
            if (![self getButtonShowState:x :y]) {
                flage = YES;
                printf("x: %d, y: %d\n", x, y);
                break;
            }
            
        }
        if (!flage) {
            [self setButtonShowState:y];
            [self resetButtonPoint:y-1];
            ++y;
            
        }
        
    }
   
    
}

-(void)addGameOverButton
{
    
}
-(BOOL)checkGameState
{
    
    if ([squreCase beyondBounds:squreCase.case1.x :squreCase.case1.y]
        || [squreCase beyondBounds:squreCase.case2.x :squreCase.case2.y]
        || [squreCase beyondBounds:squreCase.case3.x :squreCase.case3.y]
        || [squreCase beyondBounds:squreCase.case4.x :squreCase.case4.y]) {
        return YES;
        
    }
    return NO;
}

-(void)squareDownToEnd
{
    update = YES;
    [self deleteButton];
    self.squreCase = self.squreCase2;
    if ([self checkGameState]) {
        beginButton.hidden = NO;
        beginButton.enabled = YES;
        return;
    }

    [self createCase];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/
-(void)dealloc
{
    [squreCase release]; squreCase = nil;
    [super dealloc];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
