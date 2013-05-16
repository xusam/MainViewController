//
//  MainViewController.h
//  MainViewController
//
//  Created by xian on 4/21/13.
//  Copyright (c) 2013 xian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    

    UIViewController *_leftViewController;
    UIViewController *_rightViewController;
    UINavigationController *_centerViewController;
    UIViewController *_tempViewController;
    CGPoint _beginPoint;
   
    CGPoint _endPoint;

}


-(id)initWithCenterViewController:(UIViewController*)centerViewController LeftViewController:(UIViewController*)leftViewController RightViewController:(UIViewController*)rightViewController;


-(void)selectMenuChangeWithViewController:(UIViewController*)changeViewCOntroller;



@end
