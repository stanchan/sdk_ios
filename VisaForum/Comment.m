//
//  Comment.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/22/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "Comment.h"

@implementation Comment

-(instancetype)init {
    self = [super init];
    if(self) {
        self.title = nil;
        self.username = nil;
        self.timeStamp = [NSDate date];
        self.likes = [NSNumber numberWithInt:0];
    }
    
    return self;
}

//These are custom initializers, they need to be in this fashion, follow the steps because they have to be in this order
// Step 1 : self = [super init]; this creates the reference to the actual object and allocates it in memory. some classes have inits like initWithCoder, or initWithNibOrBundle
//                               these require you to use those initializers, but for custom initializers as seen below, you just use the basic [super init];
// Step 2 : if(self) { }         this step is where you check to make sure the object is actually initialized. if it is, then you can go ahead and implement it. if it is null,
//                               this will prevent a seg fault
// Step 3: return self           after your setup you return the pointer to yourself as you would in C++ or C with malloc()

-(instancetype)initWithTitle:(NSString *)title username:(NSString *)username {
    self = [super init];
    if(self) {
        self.title = title;
        self.username = username;
        self.timeStamp = [NSDate date];
        self.likes = [NSNumber numberWithInt:0];
    }
    
    return self;
}

@end
