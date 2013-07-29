#import "RootViewController.h"
#import "PhotoAppViewController.h"
#import "UIImage+Cvmat.h"

const int kCannyAperture = 7;

@interface RootViewController ()

@property (nonatomic, strong) UIImage * img;

@property (nonatomic, strong) UIImageView * imgv;
@property (nonatomic, strong) UIImageView * imgv2;

@end

@implementation RootViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.navigationItem.title = @"疯狂魔镜";
    
    UIBarButtonItem * btTest = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                             target:self
                                                                             action:@selector(leftAction:)];
    self.navigationItem.leftBarButtonItem = btTest;
    
    
    UIBarButtonItem * btCamera = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                                                      target:self
                                                                                      action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = btCamera;
    
    // UIImage Initlization
    _img = [UIImage imageNamed:@"1.jpg"];
    UIImageView * imgv = [[UIImageView alloc] initWithImage:_img];
    imgv.frame = CGRectMake(0, 0, 160, 210);
    [self.view addSubview:imgv];
    
}

- (void)didReceiveMemoryWarning{[super didReceiveMemoryWarning];}

#pragma mark IBAction

- (IBAction)leftAction:(id)sender{
    //Convert Image to Grey
    
    
    cv::Mat greyMat , lineMat;
    
    cv::Mat inputMat = [_img ConvertToCvmat4];
    cv::cvtColor(inputMat, greyMat, cv::COLOR_RGB2GRAY);
    
    cv::Canny(greyMat, lineMat,
              50 * kCannyAperture * kCannyAperture,
              200 * kCannyAperture * kCannyAperture,
              kCannyAperture);
    
    _imgv2 = [[UIImageView alloc] initWithImage:[[UIImage alloc] initWithCvmat:lineMat]];
    _imgv2.frame = CGRectMake(160, 0, 160, 210);
    [self.view addSubview:_imgv2];
}

- (IBAction)rightAction:(id)sender{
    PhotoAppViewController * pvc = [[PhotoAppViewController alloc] init];
    [self.navigationController pushViewController:pvc animated:YES];
}

@end
