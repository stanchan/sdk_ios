//
//  CustomTableViewCell.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/28/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "UserViewController.h"

@implementation CustomTableViewCell

@synthesize nameLabel = _nameLabel;
@synthesize descriptionLabel = _descriptionLabel;
@synthesize thumbnailImageView = _thumbnailImageView;
@synthesize numberOfLikesLabel = _numberOfLikesLabel;
@synthesize likeButton = _likeButton;

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

NSInteger counter = 0;
- (IBAction)like:(id)sender {
    if (sender != self.likeButton) return;
    
    //PFObject *post = [PFObject objectWithClassName:@"Posts"];
    PFQuery *query = [PFQuery queryWithClassName:@"Posts"];
    [query whereKey:@"title" equalTo:_nameLabel.text];
    [query whereKey:@"details" equalTo:_descriptionLabel.text];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            // The find succeeded.
            NSLog(@"Successfully retrieved the object.");
            NSNumber *likes = [object objectForKey:@"likes"];
            NSMutableArray *likers = [object objectForKey:@"likers"];
            PFUser *user = [PFUser currentUser];
            BOOL *containsUser = false;
            for (PFUser *u in likers) {
                [u fetchIfNeeded];
                if ([user objectForKey:@"id"] == [u objectForKey:@"id"]) {
                    containsUser = true;
                }
            }
            if (!containsUser) {
                //[object incrementKey:@"likes"];
                NSLog(@"likes == 0.");
                likes = [NSNumber numberWithInt:[likes intValue] + 1];
                _numberOfLikesLabel = [NSString stringWithFormat:@"%d", likes];
                [object setObject:likes forKey:@"likes"];
                [object addObject:user forKey:@"likers"];
                [_likeButton setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
            } else {
                NSLog(@"ELSE");
                likes = [NSNumber numberWithInt:[likes intValue] - 1];
                _numberOfLikesLabel = [NSString stringWithFormat:@"%d", likes];
                [object setObject:likes forKey:@"likes"];
                [object removeObject:user forKey:@"likers"];
                [_likeButton setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
            }
            [object saveInBackground];
        }
    }];
    
//    if (counter == 0) {
//        [_numberOfLikesLabel setText:[NSString stringWithFormat:@"%d",++counter]];
//        //NSInteger *likes = [currentUser objectForKey:@"fullName"];
//        //[_likeButton setTitle:@"Unlike" forState:UIControlStateNormal];
//        [_likeButton setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
//    } else {
//        [_numberOfLikesLabel setText:[NSString stringWithFormat:@"%d",--counter]];
//        //[_likeButton setTitle:@"Like" forState:UIControlStateNormal];
//        [_likeButton setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
//    }
}
- (IBAction)userImage:(id)sender {

}
@end
