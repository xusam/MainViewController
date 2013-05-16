//
//  MainViewController.m
//  MainViewController
//
//  Created by xian on 4/21/13.
//  Copyright (c) 2013 xian. All rights reserved.
//

#import "MainViewController.h"
#define VIEW_X   180
#define VIEW_Y   0
#define VIEW_WIDTH  [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define VIEW_BOUND   260
@interface MainViewController ()

@end

@implementation MainViewController

-(id)initWithCenterViewController:(UIViewController*)centerViewController LeftViewController:(UIViewController*)leftViewController RightViewController:(UIViewController*)rightViewController{
    self = [super init];
    if (self) {
        // Custom initialization
        
        
        
       
      
        _leftViewController=leftViewController;
        _leftViewController.view.frame = self.view.bounds;
        _rightViewController=rightViewController;
        _rightViewController.view.frame = self.view.bounds;
        [self.view addSubview:_rightViewController.view];
        [self.view addSubview:_leftViewController.view];
        [self makeNavigationControllerWithRootViewController:centerViewController];
    }
    return self;
}

-(void)makeNavigationControllerWithRootViewController:(UIViewController*)rootViewController{
   
    _centerViewController=[[UINavigationController alloc] initWithRootViewController:rootViewController];
    
   
   _centerViewController.view.frame=self.view.bounds;
    

    [self.view addSubview:_centerViewController.view];
   
    
    rootViewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"菜单" style:UIBarButtonItemStyleBordered target:self action:@selector(showLeftMenu:)];
    
    UIPanGestureRecognizer *panGestureRecognizer  = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handelPan:)];
	[rootViewController.view addGestureRecognizer:panGestureRecognizer];
}

-(void)handelPan:(UIPanGestureRecognizer*)gestureRecognizer{
    //获取平移手势对象在self.view的位置点，并将这个点作为self.aView的center,这样就实现了拖动的效果
   
  
    CGPoint _curPoint;
    
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan)
	{
		NSLog(@"gestureRecognizer Start");
        _beginPoint= [gestureRecognizer locationInView:self.view];
        _curPoint=_centerViewController.view.center;
		
	}

	else if(gestureRecognizer.state == UIGestureRecognizerStateChanged)
	{
		NSLog(@"gestureRecognizer Starting");
        _endPoint=[gestureRecognizer locationInView:self.view];
         
    
            _curPoint.x=_curPoint.x+_endPoint.x-_beginPoint.x;
            _centerViewController.view.center=_curPoint;
        NSLog(@"向左");
      
		

	}
	
	else if(gestureRecognizer.state == UIGestureRecognizerStateEnded)
	{
        NSLog(@"gestureRecognizer Startend");
    }

}

-(void)showLeftMenu:(id)sender{
    
    CGRect originalRect=self.view.bounds;
    originalRect.origin.x=VIEW_BOUND;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    _centerViewController.view.frame=originalRect;
    [UIView commitAnimations];
    
    
}



-(void)selectMenuChangeWithViewController:(UIViewController*)changeViewController{
    
    if(changeViewController==nil){
        NSLog(@"null");
        return;
        
    }
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
