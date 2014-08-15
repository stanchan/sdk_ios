//
//  AddPostViewController.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/23/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Posts.h"

@interface AddPostViewController : UIViewController <UITextFieldDelegate>

@property Posts *post;
@property (weak, nonatomic) IBOutlet UIView *box;

@end
