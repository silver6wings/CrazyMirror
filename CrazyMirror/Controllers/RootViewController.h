//
//  ViewController.h
//  CrazyMirror
//
//  Created by Junchao Yu on 13-7-1.
//  Copyright (c) 2013年 Junchao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController < UINavigationControllerDelegate, UIImagePickerControllerDelegate >
{   
    UIImagePickerController * picker;
}

@end
