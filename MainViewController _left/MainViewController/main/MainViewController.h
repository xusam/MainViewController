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
 
    UINavigationController *_centerViewController;
    UIViewController *_tempViewController;
    CGPoint _beginPoint; 
    CGPoint _changedPoint;
    CGPoint _movePoint;
    CGPoint _curPoint;
    CGPoint _subPoint;
    int   _clickcount;
    BOOL _isShowLeftMenu;
  
    

}


-(id)initWithCenterViewController:(UIViewController*)centerViewController LeftViewController:(UIViewController*)leftViewController RightViewController:(UIViewController*)rightViewController;


-(void)selectMenuChangeWithViewController:(UIViewController*)changeViewCOntroller;



@end
