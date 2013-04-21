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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
