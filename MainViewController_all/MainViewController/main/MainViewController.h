//
//  MainViewController.h
//  MainViewController
//
//  Created by xian on 4/21/13.
//  Copyright (c) 2013 xian. All rights reserved.
//

#import <UIKit/UIKit.h>
//1代表只显示左 2代表只显示右 3代表左右都显示
typedef enum {
    MenuType_ShowLeft = 1,
    MenuType_ShowRight = 2,
    MenuType_ShowLeftAndRight = 3,
} MenuType;

@interface MainViewController : UIViewController
{
    

    UIViewController *_leftViewController;
    UIViewController *_rightViewController;
    UINavigationController *_centerViewController;
    UIViewController *_tempViewController;
    CGPoint _beginPoint; 
    CGPoint _changedPoint;
    CGPoint _movePoint;
    CGPoint _curPoint;
    CGPoint _subPoint;
    int   _clickcount;
    MenuType  _menuType;
    BOOL  _is_ShowLeft;
    

}


-(id)initWithCenterViewController:(UIViewController*)centerViewController LeftViewController:(UIViewController*)leftViewController RightViewController:(UIViewController*)rightViewController menuType:(MenuType) menuType;


-(void)selectMenuChangeWithViewController:(UIViewController*)changeViewCOntroller;



@end
