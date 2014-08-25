//
//  RegisterViewController.h
//  VisaForum
//
//  Created by Hriday Kemburu on 8/12/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import <Parse/Parse.h>

@protocol RegistrationDelegate <NSObject>
-(void)registrationViewDidReturn:(NSDictionary *)results;
@end

@interface RegisterViewController : UIViewController <UIActionSheetDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property User *user;
@property (weak, nonatomic) IBOutlet UITextField *userTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassTextField;
//- (IBAction)registerAccount:(id)sender;
//@property (weak, nonatomic) IBOutlet UIButton *registerAccountButton;
- (IBAction)uploadImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UITextField *position;
@property (weak, nonatomic) IBOutlet UIButton *uploadImageButton;
- (IBAction)registerAccount:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *registerAccountButton;
@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;

//@property id<RegistrationDelegate> delegate;

- (IBAction)cancelRegistration:(id)sender;
@end
