//
//  User.h
//  VisaForum
//
//  Created by Hriday Kemburu on 8/12/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, weak) UIImage *userImage;

@end
