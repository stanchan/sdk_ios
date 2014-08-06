//
//  LoginViewController.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/21/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "LoginViewController.h"
#import "PostsTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernameTextField = _usernameTextField;
@synthesize passwordTextField = _passwordTextField;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.loginButton.layer.cornerRadius = 4.0;
    self.loginButton.layer.borderWidth = 1.0;
    //self.loginButton.layer.borderColor = [UIColor colorWithRed:.5 green:.8 blue: 1 alpha:.7].CGColor;
    self.loginButton.layer.borderColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:.7].CGColor;
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
//    NSLog(@"Source Controller = %@", [segue sourceViewController]);
//    NSLog(@"Destination Controller = %@", [segue destinationViewController]);
//    NSLog(@"Segue Identifier = %@", [segue identifier]);
//    
//    if ([segue.identifier isEqualToString:@"toPosts"])
//    {
//        NSLog(@"coming here");
//        
//        PostsTableViewController *loginViewController = (PostsTableViewController *)segue.destinationViewController;
//        
//        //SecondViewController *navigationController = [[UINavigationController alloc]init];
//        
//        [self presentViewController:loginViewController animated:YES completion:nil];
//        
//        
//    }
}


- (IBAction)login:(id)sender {
    int beginningLength = self.usernameTextField.text.length - 9;
    int endLength = 9;
    NSString *visa = @"@visa.com";
    if(self.usernameTextField.text.length < 9 || self.passwordTextField.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login"
                                                        message:@"Username or password is too short."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];   
    } else if (![[self.usernameTextField.text substringWithRange:NSMakeRange(beginningLength, endLength)] isEqualToString:visa]) {
        NSLog(@"%@", [self.usernameTextField.text substringWithRange:NSMakeRange(beginningLength, endLength)]);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login"
                                                        message:@"Not a valid visa email."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
        PostsTableViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"postTableViewControllerID" ];
        self.navigationController.viewControllers = [[NSArray alloc] initWithObjects:vc, nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue
{
    
}

@end
