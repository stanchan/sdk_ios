//
//  Posts.h
//  VisaForum
//
//  Created by Hriday Kemburu on 7/22/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Posts : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *details;
@property (nonatomic, strong) NSMutableArray *comments;
@property (nonatomic, strong) NSDate *timestamp;
@property BOOL completed;

-(instancetype)initWithUsername:(NSString *)username title:(NSString *)title details:(NSString *)details;

@end
