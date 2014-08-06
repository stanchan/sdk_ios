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
    if (counter == 0) {
        [_numberOfLikesLabel setText:[NSString stringWithFormat:@"%d",++counter]];
        //[_likeButton setTitle:@"Unlike" forState:UIControlStateNormal];
        [_likeButton setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
    } else {
        [_numberOfLikesLabel setText:[NSString stringWithFormat:@"%d",--counter]];
        //[_likeButton setTitle:@"Like" forState:UIControlStateNormal];
        [_likeButton setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
    }
}
- (IBAction)userImage:(id)sender {

}
@end
