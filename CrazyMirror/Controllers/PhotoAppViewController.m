//
//  PhotoAppViewController.m
//  CrazyMirror
//
//  Created by Junchao Yu on 13-7-8.
//  Copyright (c) 2013年 Junchao Yu. All rights reserved.
//

#import "PhotoAppViewController.h"

@interface PhotoAppViewController ()

@end

@implementation PhotoAppViewController
@synthesize imageView,choosePhotoBtn, takePhotoBtn;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) getPhoto:(id) sender {
    
    if (_picker == nil) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.delegate = self;
    }// create once!
    
    if((UIButton *) sender == choosePhotoBtn) {
        _picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:_picker animated:YES completion:nil];
    } else {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            _picker.allowsEditing = NO;
            _picker.showsCameraControls = YES;
            [self presentViewController:_picker animated:YES completion:nil];
        } else {
            NSLog(@"模拟器上跑不了相机功能");
        }
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [_picker dismissViewControllerAnimated:YES completion:nil];
    imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

@end
