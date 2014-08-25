//
//  PostsTableViewController.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/22/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPostViewController.h"
#import "CustomTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import <Parse/Parse.h>

@interface PostsTableViewController : PFQueryTableViewController <UIActionSheetDelegate>
- (IBAction)addPost:(id)sender;
@property (nonatomic, strong) NSString *username;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;

- (IBAction)logoutUser:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *postTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *postDetailLabel;
- (IBAction)like:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *likeButtonOutlet;
@property (weak, nonatomic) IBOutlet UILabel *numberOfLikes;
@property (strong, nonatomic) IBOutlet UITableViewCell *postTableViewCell;

@end
