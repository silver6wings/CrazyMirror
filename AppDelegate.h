//
//  AppDelegate.h
//  CrazyMirror
//
//  Created by Junchao Yu on 13-7-1.
//  Copyright (c) 2013年 Junchao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    UINavigationController * navController;
    
}

@property (strong, nonatomic) UINavigationController * navController;

@property (strong, nonatomic) UIWindow *window;

@end
