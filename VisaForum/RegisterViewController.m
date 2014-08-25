//
//  RegisterViewController.m
//  VisaForum
//
//  Created by Hriday Kemburu on 8/12/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "RegisterViewController.h"
#import "Parse/Parse.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize userTextField = _userTextField;
@synthesize passTextField = _passTextField;
@synthesize confirmPassTextField = _confirmPassTextField;
@synthesize position = _position;
@synthesize userImage = _userImage;
@synthesize uploadImageButton = _uploadImageButton;
@synthesize fullNameTextField = _fullNameTextField;
//@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];

    _userTextField.delegate = self;
    _passTextField.delegate = self;
    _confirmPassTextField.delegate = self;
    _position.delegate = self;
    _fullNameTextField.delegate = self;

    _userImage.layer.cornerRadius = _userImage.frame.size.height /2;
    _userImage.layer.masksToBounds = YES;
    _userImage.layer.borderWidth = 3;
    _userImage.layer.borderColor = [UIColor orangeColor].CGColor;
    _userImage.image = [UIImage imageNamed:@"male18.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_userTextField resignFirstResponder];
    [_passTextField resignFirstResponder];
    [_confirmPassTextField resignFirstResponder];
    [_position resignFirstResponder];
    [_fullNameTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    int beginningLength = self.userTextField.text.length - 9;
//    int endLength = 9;
//    NSString *visa = @"@visa.com";
//    if (sender != self.registerAccountButton) return;
//    if (self.userTextField.text.length >= 9 && self.passTextField.text.length > 0 && self.position.text.length > 0 && self.confirmPassTextField.text.length > 0 && [[self.userTextField.text substringWithRange:NSMakeRange(beginningLength, endLength)] isEqualToString:visa] && [self.passTextField.text isEqualToString:self.confirmPassTextField.text]) {
//        self.user = [[User alloc] init];
//        self.user.username = self.userTextField.text;
//        self.user.password = self.passTextField.text;
//        self.user.title = self.position.text;
//        self.user.userImage = self.userImage.image;
//        NSLog(@"GOT HERE");//
//    } else {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login or Password"
//                                                        message:@"Username or password is too short."
//                                                       delegate:nil
//                                              cancelButtonTitle:@"OK"
//                                              otherButtonTitles:nil];
//        [alert show];
//    }
}

- (IBAction)uploadImage:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Upload From Gallery", @"Take Picture", nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    if (buttonIndex == 0) {
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [self presentViewController:picker animated:YES completion:nil];
    } else if (buttonIndex == 1) {
        //take picture from camera (doesn't work on simulator)
        //picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //[self presentModalViewController:picker animated:YES];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissViewControllerAnimated:YES completion:nil];
	_userImage.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

- (IBAction)cancelRegistration:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerAccount:(id)sender {
    int beginningLength = self.userTextField.text.length - 9;
    int endLength = 9;
    NSString *visa = @"@visa.com";
    if(self.userTextField.text.length < 9 || self.passTextField.text.length == 0 || self.position.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login or Password"
                                                        message:@"Username or password is too short."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else if (![[self.userTextField.text substringWithRange:NSMakeRange(beginningLength, endLength)] isEqualToString:visa]) {
        NSLog(@"%@", [self.userTextField.text substringWithRange:NSMakeRange(beginningLength, endLength)]);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login"
                                                        message:@"Not a valid visa email. Must be '@visa.com'"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else if (![self.passTextField.text isEqualToString:self.confirmPassTextField.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Password"
                                                        message:@"Passwords do not match."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    } else {
//        if(_delegate) {
//            [_delegate registrationViewDidReturn:nil];
//        }
//        [self dismissViewControllerAnimated:YES completion:nil];
        
//        PFObject *user= [PFObject objectWithClassName:@"User"];
//        NSString *username =[self.userTextField.text substringWithRange:NSMakeRange(0, beginningLength)];
//        [user setObject:username forKey:@"username"];
//        [user setObject:self.passTextField.text forKey:@"password"];
//        [user setObject:self.position.text forKey:@"title"];
//        [user setObject:self.userTextField.text forKey:@"email"];
//        //[user setObject:self.userImage.image forKey:@"userImage"];
//        [user saveInBackground];
//        [self dismissViewControllerAnimated:YES completion:nil];
        
        // 1
        PFUser *user = [PFUser user];
        //2
        user.username = _userTextField.text;
        user.password = _passTextField.text;
        //NSString *firstName = [self.userTextField.text substringWithRange:NSMakeRange(0, beginningLength)];
        //NSString *lastName = ;
        [user setObject:_fullNameTextField.text forKey:@"fullName"];
        [user setObject:_position.text forKey:@"position"];
        
        
        //Upload a new picture
        //1
        NSData *pictureData = UIImagePNGRepresentation(_userImage.image);
        PFFile *file = [PFFile fileWithName:@"img" data:pictureData];
        [user setObject:file forKey:@"picture"];
        [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            if (succeeded){
                //2
                //Add the image to the object, and add the comment and the user
                //PFObject *imageObject = [PFObject objectWithClassName:@"WallImageObject"];
                //[user setObject:file forKey:@"picture"];
                //[imageObject setObject:[PFUser currentUser].username forKey:@"user"];
                //[imageObject setObject:self.commentTextField.text forKey:@"comment"];
            }
            else{
                //5
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [errorAlertView show];
            }        
        } progressBlock:^(int percentDone) {
            NSLog(@"Uploaded: %d %%", percentDone);
        }];
        
        //[user setObject:self.userImage.image forKey:@"picture"];
        //3
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                //The registration was successful, go to the wall
                [self dismissViewControllerAnimated:YES completion:nil];
                
            } else {
                //Error has occurred
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [errorAlertView show];
            }
        }];
    }
}

@end
