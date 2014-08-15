//
//  User.m
//  VisaForum
//
//  Created by Hriday Kemburu on 8/12/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)init {
    self = [super init];
    if(self) {
        self.username = nil;
        self.title = nil;
        self.password = nil;
        self.userImage = nil;
    }
    return self;
}

//These are custom initializers, they need to be in this fashion, follow the steps because they have to be in this order
// Step 1 : self = [super init]; this creates the reference to the actual object and allocates it in memory. some classes have inits like initWithCoder, or initWithNibOrBundle
//                               these require you to use those initializers, but for custom initializers as seen below, you just use the basic [super init];
// Step 2 : if(self) { }         this step is where you check to make sure the object is actually initialized. if it is, then you can go ahead and implement it. if it is null,
//                               this will prevent a seg fault
// Step 3: return self           after your setup you return the pointer to yourself as you would in C++ or C with malloc()

-(instancetype)initWithUsername:(NSString *)username title:(NSString *)title details:(NSString *)details {
    self = [super init];
    if(self) {
        self.username = username;
        self.title = title;
        //self.password = password;
        //self.userImage = userImage;
    }
    return self;
    
}

@end
