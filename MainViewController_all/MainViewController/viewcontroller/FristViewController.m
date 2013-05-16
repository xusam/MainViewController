//
//  FristViewController.m
//  MainViewController
//
//  Created by xian on 4/21/13.
//  Copyright (c) 2013 xian. All rights reserved.
//

#import "FristViewController.h"

@interface FristViewController ()

@end

@implementation FristViewController

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
    self.title=@"1";
    
    self.view.backgroundColor=[UIColor redColor];
    
    
    
    UIButton *btn1=[[UIButton alloc] initWithFrame:CGRectMake(10, 10, 200, 45)];
    [btn1 setTitle:@"push" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(selectBtn2:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag=1;
    [self.view addSubview:btn1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)selectBtn2:(UIButton*)btn{
    NSLog(@"OK1");
    
    NSLog(@"OK");
    
 
    
    [self dismissModalViewControllerAnimated:YES];
    
    
}
@end
