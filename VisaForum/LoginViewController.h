//
//  LoginViewController.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/21/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)login:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue;

@end
