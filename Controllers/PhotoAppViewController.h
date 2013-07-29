#import <UIKit/UIKit.h>

@interface PhotoAppViewController : UIViewController < UIImagePickerControllerDelegate, UINavigationControllerDelegate >
{
    UIImagePickerController * _picker;
    UIImageView * imageView;
    UIButton * choosePhotoBtn;
    UIButton * takePhotoBtn;
}
@property (nonatomic, retain) IBOutlet UIImageView * imageView;
@property (nonatomic, retain) IBOutlet UIButton * choosePhotoBtn;
@property (nonatomic, retain) IBOutlet UIButton * takePhotoBtn;

-(IBAction) getPhoto:(id) sender;

@end