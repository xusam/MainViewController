//
//  HomeViewController.m
//  MainViewController
//
//  Created by xian on 4/21/13.
//  Copyright (c) 2013 xian. All rights reserved.
//

#import "HomeViewController.h"
#import "FristViewController.h"
#import "SecondViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

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
    self.view.backgroundColor=[UIColor grayColor];
    self.title=@"Home";
    UIButton *btn1=[[UIButton alloc] initWithFrame:CGRectMake(10, 10, 200, 45)];
    [btn1 setTitle:@"push" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag=1;
    [self.view addSubview:btn1];
    
    UIButton *btn2=[[UIButton alloc] initWithFrame:CGRectMake(10, 80, 200, 45)];
    [btn2 setTitle:@"mode" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag=2;
    [self.view addSubview:btn2];
    
	// Do any additional setup after loading the view.
}
-(void)selectBtn:(UIButton*)btn{
    NSLog(@"OK1");
   
             NSLog(@"OK");
            FristViewController * vc=[[FristViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
