//
//  ForumViewController.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/24/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Posts.h"
#import "Comment.h"
#import "ForumTableViewCell.h"

@interface ForumViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextView *forumTextView;
@property (weak, nonatomic) IBOutlet UITableView *commentTableView;
@property Posts *post;
@property (weak, nonatomic) IBOutlet UIToolbar *postToolbar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *commentTextField;
- (IBAction)postComment:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *postButton;
@property (weak, nonatomic) IBOutlet UITextField *commentText;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UITextView *profileName;
@property (weak, nonatomic) IBOutlet UITextView *dateOfPost;

@end
