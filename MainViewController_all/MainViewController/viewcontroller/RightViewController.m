//
//  RightViewController.m
//  MainViewController
//
//  Created by xian on 4/21/13.
//  Copyright (c) 2013 xian. All rights reserved.
//

#import "RightViewController.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "FristViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
@interface RightViewController ()

@end

@implementation RightViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor purpleColor];
    UIButton * btn1=[[UIButton alloc] initWithFrame:CGRectMake(10, 10, 200, 45)];
    [btn1 setTitle:@"菜单1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag=1;
    [self.view addSubview:btn1];
    
    UIButton * btn2=[[UIButton alloc] initWithFrame:CGRectMake(10, 80, 200, 45)];
    [btn2 setTitle:@"菜单2" forState:UIControlStateNormal];
    btn2.tag=2;
    [btn2 addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    UIButton * btn3=[[UIButton alloc] initWithFrame:CGRectMake(10, 150, 200, 45)];
    btn3.tag=3;
    [btn3 setTitle:@"菜单3" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    UIButton * btn4=[[UIButton alloc] initWithFrame:CGRectMake(10, 230, 200, 45)];
    btn4.tag=4;
    [btn4 setTitle:@"菜单4" forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(selectMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)selectMenu:(UIButton*)btn{
    
    switch (btn.tag) {
        case 1:
        {
            MainViewController* mainViewController= (MainViewController*) ((AppDelegate*)[[UIApplication sharedApplication] delegate]).window.rootViewController;
            FristViewController * vc=[[FristViewController alloc] init];
            [mainViewController selectMenuChangeWithViewController:vc];
            
        }
            break;
        case 2:
        {
            MainViewController* mainViewController= (MainViewController*) ((AppDelegate*)[[UIApplication sharedApplication] delegate]).window.rootViewController;
            SecondViewController * vc=[[SecondViewController alloc] init];
            [mainViewController selectMenuChangeWithViewController:vc];
        }
            break;
        case 3:
        {
            MainViewController* mainViewController= (MainViewController*) ((AppDelegate*)[[UIApplication sharedApplication] delegate]).window.rootViewController;
            ThreeViewController * vc=[[ThreeViewController alloc] init];
            [mainViewController selectMenuChangeWithViewController:vc];
        }
            break;
        case 4:
        {
            MainViewController* mainViewController= (MainViewController*) ((AppDelegate*)[[UIApplication sharedApplication] delegate]).window.rootViewController;
            FourViewController * vc=[[FourViewController alloc] init];
            [mainViewController selectMenuChangeWithViewController:vc];
        }
            break;
            
        default:
            break;
    }
    
}

@end
