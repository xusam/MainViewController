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
    
    
}


-(void)showLeftMenu:(id)sender{
    
    CGRect originalRect=self.view.bounds;
    originalRect.origin.x=200;
    _centerViewController.view.frame=originalRect;
    
}


-(void)selectMenuChangeWithViewController:(UIViewController*)changeViewCOntroller{

    if(changeViewCOntroller==nil){
        NSLog(@"null");
        return;
        
    }
    [_centerViewController.view removeFromSuperview ];
    [self makeNavigationControllerWithRootViewController:changeViewCOntroller];
    
    
    
   
   



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
