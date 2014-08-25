//
//  ForumTableViewCell.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/28/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForumViewController.h"
#import "ForumCommentTableViewController.h"
#import "Parse/Parse.h"

@interface ForumTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *commentImage;
@property (weak, nonatomic) IBOutlet UIButton *commentLikeButton;
- (IBAction)likeComment:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberOfLikes;
@property (weak, nonatomic) IBOutlet UITextView *date;

@end
