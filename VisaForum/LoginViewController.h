//
//  LoginViewController.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/21/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController : UIViewController <UITextViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)login:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *registerButton;

- (IBAction)register:(id)sender;

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue;

- (IBAction)registerNewAccount:(id)sender;

@end
