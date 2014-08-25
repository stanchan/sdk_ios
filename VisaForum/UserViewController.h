//
//  UserViewController.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/30/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForumViewController.h"

@interface UserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UITextView *userName;
@property (weak, nonatomic) IBOutlet UITextView *userDescription;
@property PFObject *postObj;

@end
