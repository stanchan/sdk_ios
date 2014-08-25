//
//  ForumTableViewCell.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/28/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "ForumTableViewCell.h"

@implementation ForumTableViewCell

@synthesize commentLabel = _commentLabel;
@synthesize commentImage = _commentImage;
@synthesize commentNumberOfLikes = _commentNumberOfLikes;
@synthesize commentLikeButton = _commentLikeButton;

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

NSInteger counterTwo = 0;
- (IBAction)likeComment:(id)sender {
    if (sender != self.commentLikeButton) return;
    if (counterTwo == 0) {
        [_commentNumberOfLikes setText:[NSString stringWithFormat:@"%d",++counterTwo]];
        //[_commentLikeButton setTitle:@"Unlike" forState:UIControlStateNormal];
        [_commentLikeButton setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
    } else {
        [_commentNumberOfLikes setText:[NSString stringWithFormat:@"%d",--counterTwo]];
        //[_commentLikeButton setTitle:@"Like" forState:UIControlStateNormal];
        [_commentLikeButton setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
    }
}
@end
