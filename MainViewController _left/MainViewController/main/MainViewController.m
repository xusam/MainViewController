//
//  MainViewController.m
//  MainViewController
//
//  Created by xian on 4/21/13.
//  Copyright (c) 2013 xian. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>
#define VIEW_X   180
#define VIEW_Y   0
#define VIEW_WIDTH  [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define VIEW_BOUND   260
#define VIEW_CENTER  160
#define VIEW_SIDE    230
#define MainView_width self.view.bounds.size.width
@interface MainViewController ()

@end

@implementation MainViewController

-(id)initWithCenterViewController:(UIViewController*)centerViewController LeftViewController:(UIViewController*)leftViewController RightViewController:(UIViewController*)rightViewController {
    self = [super init];
    if (self) {
        
        _clickcount=0;
        _isShowLeftMenu=NO;
        _leftViewController=leftViewController;
        CGRect menuRect=self.view.bounds;
        menuRect.origin.x=-MainView_width;
        _leftViewController.view.frame = menuRect;
        menuRect.origin.x=MainView_width;
        [self.view addSubview:_leftViewController.view];
        [self makeNavigationControllerWithRootViewController:centerViewController];
    }
    return self;
}

-(void)makeNavigationControllerWithRootViewController:(UIViewController*)rootViewController {
    
    _centerViewController=[[UINavigationController alloc] initWithRootViewController:rootViewController];
    
    
    _centerViewController.view.frame=self.view.bounds;
    _centerViewController.view.layer.masksToBounds = NO;
    _centerViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    _centerViewController.view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    _centerViewController.view.layer.shadowOpacity = 0.4f;
    _centerViewController.view.layer.shadowRadius = 2.5f;
    _centerViewController.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:_centerViewController.view.bounds].CGPath;
    
    
    [self.view addSubview:_centerViewController.view];
    
    
    rootViewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStyleBordered target:self action:@selector(showLeftMenu:)];
    
    UIPanGestureRecognizer *panGestureRecognizer  = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handelPan:)];
	[rootViewController.view addGestureRecognizer:panGestureRecognizer];
}

-(void)handelPan:(UIPanGestureRecognizer*)gestureRecognizer{
    //获取平移手势对象在self.view的位置点，并将这个点作为self.aView的center,这样就实现了拖动的效果
    
    
    
    
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan)
	{
		
        _beginPoint= [gestureRecognizer locationInView:self.view];
        _curPoint=_centerViewController.view.center;
        
		
	}
    
	else if(gestureRecognizer.state == UIGestureRecognizerStateChanged)
	{
		
        _changedPoint=[gestureRecognizer locationInView:self.view];
        
        
        
        _subPoint.x=_changedPoint.x-_beginPoint.x;
        _subPoint.y=_curPoint.y;
        
        
        [self showMenuByPanWithSubPoint:_subPoint];
        
        
        
        
		
        
	}
	
	else if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
	{
        
        
        [self isShowLeftMenuWithSubPoint:_subPoint];
    }
    
}


-(void)showMenuByPanWithSubPoint:(CGPoint) subPoint{
    //右滑
    
    CGRect  centerRect=   _centerViewController.view.frame;
    if(subPoint.x>0){
        _movePoint.x=_curPoint.x+subPoint.x;
        _movePoint.y=_curPoint.y;
        if(centerRect.origin.x<VIEW_BOUND){
            CGPoint menuPoint;
            menuPoint.x=menuPoint.x+subPoint.x;
            menuPoint.y=_curPoint.y;
            if(menuPoint.x<VIEW_CENTER){
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.3];
                [UIView setAnimationCurve:UIViewAnimationCurveLinear];
                _leftViewController.view.center=menuPoint;
                [UIView commitAnimations];
                _centerViewController.view.center=_movePoint;
            }
   
        }
 
    }else{
        
        if(centerRect.origin.x<=VIEW_BOUND&&centerRect.origin.x>60){
            _movePoint.x=_curPoint.x+subPoint.x;
            _movePoint.y=_curPoint.y;
            NSLog(@"_movePoint.x:%f",_movePoint.x);
            _centerViewController.view.center=_movePoint;
            
        
        }
        
    }
    
    
    
    
    
}
-(void)isShowLeftMenuWithSubPoint:(CGPoint) subPoint{
    
    if(_centerViewController.view.center.x>VIEW_SIDE){
        _isShowLeftMenu=YES;
        CGRect originalRect=self.view.bounds;
        originalRect.origin.x=VIEW_BOUND;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _centerViewController.view.frame=originalRect;
        [UIView commitAnimations];
        
        CGRect menuRect=self.view.bounds;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _leftViewController.view.frame=menuRect;
        [UIView commitAnimations];
        
        
    }else{
        CGRect originalRect=self.view.bounds;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _centerViewController.view.frame=originalRect;
        [UIView commitAnimations];
        
        CGRect menuRect=self.view.bounds;
        if(_isShowLeftMenu==NO){
        menuRect.origin.x=-VIEW_BOUND;
        }else{
        menuRect.origin.x=-VIEW_BOUND;
        }
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _leftViewController.view.frame=menuRect;
        [UIView commitAnimations];
        
    }
    
}
-(void)showLeftMenu:(id)sender{
    
    if(_clickcount==0){
        
        _clickcount+=1;
        CGRect originalRect=self.view.bounds;
        originalRect.origin.x=VIEW_BOUND;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _centerViewController.view.frame=originalRect;
        [UIView commitAnimations];
        
        CGRect menuRect=self.view.bounds;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _leftViewController.view.frame=menuRect;
        [UIView commitAnimations];
        
        
        
        
    }else if(_clickcount==1){
        _clickcount-=1;
        
        CGRect originalRect=self.view.bounds;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _centerViewController.view.frame=originalRect;
        [UIView commitAnimations];
        
        CGRect menuRect=self.view.bounds;
        menuRect.origin.x=-MainView_width;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        _leftViewController.view.frame=menuRect;
        [UIView commitAnimations];
        
    }
    
}


-(void)selectMenuChangeWithViewController:(UIViewController*)changeViewController{
    
    if(changeViewController==nil){
        
        return;
        
    }
    _clickcount=0;
    _tempViewController=changeViewController;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animateDidStop)];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    _centerViewController.view.frame=self.view.bounds;
    [UIView commitAnimations];
    
}
-(void)animateDidStop{
    
    [_centerViewController.view removeFromSuperview ];
    [self makeNavigationControllerWithRootViewController:_tempViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
