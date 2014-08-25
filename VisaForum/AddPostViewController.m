//
//  AddPostViewController.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/23/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "AddPostViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface AddPostViewController ()
@property (weak, nonatomic) IBOutlet UITextField *postTitle;
@property (weak, nonatomic) IBOutlet UITextField *postSubtitle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *postButton;

@end

@implementation AddPostViewController
{
    NSArray *tableData;
    NSArray *thumbnails;
}

@synthesize postTitle = _postTitle;
@synthesize postSubtitle = _postSubtitle;

- (void)viewDidLoad
{
    [super viewDidLoad];

    _postTitle.delegate = self;
    _postSubtitle.delegate = self;
    self.box.layer.cornerRadius = 5;
    self.box.layer.masksToBounds = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_postTitle resignFirstResponder];
    [_postSubtitle resignFirstResponder];
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
    if (sender != self.postButton) return;
    if (self.postTitle.text.length > 0 && self.postSubtitle.text.length > 0) {
//        self.post = [[Posts alloc] init];
//        self.post.title = self.postTitle.text;
//        self.post.details = self.postSubtitle.text;
//        self.post.completed = NO;
        //self.post.username = ;
        
        PFObject *post= [PFObject objectWithClassName:@"Posts"];
        [post setObject:self.postTitle.text forKey:@"title"];
        [post setObject:self.postSubtitle.text forKey:@"details"];
        post[@"likes"] = @0;
        [post setObject:[PFUser currentUser] forKey:@"user"];
        PFUser *user = [post objectForKey:@"user"];
        NSString *username = [user objectForKey:@"username"];
        [post setObject:username forKey:@"username"];
        post[@"fullName"] = [user objectForKey:@"fullName"];
        post[@"imageFile"] = [user objectForKey:@"picture"];
        
        NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
        [dateformate setDateFormat:@"MM/dd/YYYY"];
        NSString *date_String=[dateformate stringFromDate:[NSDate date]];
        post[@"timeStamp"] = date_String;
        
        [post saveInBackground];
    }
}

@end
