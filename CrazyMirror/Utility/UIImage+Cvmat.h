#import <UIKit/UIKit.h>

@interface UIImage (UIImage_Cvmat)

- (UIImage *)initWithCvmat:(cv::Mat)cvMat;

- (cv::Mat)ConvertToCvmat4;

@end
