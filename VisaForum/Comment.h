//
//  Comment.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/22/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, strong) NSNumber *likes;
@property (nonatomic, strong) NSString *username;

-(instancetype)initWithTitle:(NSString *)title username:(NSString *)username;

@end
