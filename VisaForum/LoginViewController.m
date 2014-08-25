//
//  LoginViewController.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/21/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "LoginViewController.h"
#import "PostsTableViewController.h"
#import "User.h"
#import "RegisterViewController.h"

@interface LoginViewController () {
    NSMutableArray *users;
    //RegisterViewController *regVC;
}

@end

@implementation LoginViewController

@synthesize usernameTextField = _usernameTextField;
@synthesize passwordTextField = _passwordTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    users = [[NSMutableArray alloc] init];
    
    self.loginButton.layer.cornerRadius = 4.0;
    self.loginButton.layer.borderWidth = 1.0;
    self.loginButton.layer.borderColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.7].CGColor;
    
    self.registerButton.layer.cornerRadius = 4.0;
    self.registerButton.layer.borderWidth = 1.0;
    self.registerButton.layer.borderColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.7].CGColor;
    
    _usernameTextField.delegate = self;
    _passwordTextField.delegate = self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)registrationViewDidReturn:(NSDictionary *)results {
//    NSLog(@"HEY IT WORKS");
//    [self performSegueWithIdentifier:@"toPosts" sender:self];
//}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toPosts"]) {
        PostsTableViewController *postVC = [segue destinationViewController];
        postVC.username = self.usernameTextField.text;
    }
    
//    if([segue.identifier isEqualToString:@"toRegister"]) {
//        regVC = [segue destinationViewController];
//        regVC.delegate = self;
//    }
}


- (IBAction)login:(id)sender {
//    int beginningLength = self.usernameTextField.text.length - 9;
//    int endLength = 9;
//    NSString *visa = @"@visa.com";
//    if(self.usernameTextField.text.length < 9 || self.passwordTextField.text.length == 0) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login"
//                                                        message:@"Username or password is too short."
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];   
//    } else if (![[self.usernameTextField.text substringWithRange:NSMakeRange(beginningLength, endLength)] isEqualToString:visa]) {
//        NSLog(@"%@", [self.usernameTextField.text substringWithRange:NSMakeRange(beginningLength, endLength)]);
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login"
//                                                        message:@"Not a valid visa email."
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//    } else {
//        NSLog(@"%d", [users count]);
//        PostsTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"postTableViewControllerID" ];
//        //self.navigationController.viewControllers = [[NSArray alloc] initWithObjects:vc, nil];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password:self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        NSLog(@"%@", self.usernameTextField.text);
        NSLog(@"%@", self.passwordTextField.text);
        if (user) {
            //Open the wall
            //[self performSegueWithIdentifier:@"LoginSuccesful" sender:self];
            PostsTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"postTableViewControllerID" ];
            [self.navigationController pushViewController:vc animated:YES];
        } else {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue
{
    //users = [[NSMutableArray alloc] init];
    RegisterViewController *source = [segue sourceViewController];
    User *item = source.user;
    if (item != nil) {
        [users addObject:item];
    }
}

- (IBAction)register:(id)sender {
    RegisterViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"registerViewControllerID" ];
    //[self.storyboard instantiateViewControllerWithIdentifier:@"registerViewControllerID" ];
    self.navigationController.viewControllers = [[NSArray alloc] initWithObjects:vc, nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)registerNewAccount:(id)sender {
    [self performSegueWithIdentifier:@"toRegister" sender:self];
}
@end
