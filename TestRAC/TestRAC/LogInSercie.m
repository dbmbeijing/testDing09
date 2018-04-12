//
//  LogInSercie.m
//  TestRAC
//
//  Created by xdf on 2018/3/22.
//  Copyright © 2018年 xdf. All rights reserved.
//

#import "LogInSercie.h"

@implementation LogInSercie

- (void)signInWithUsername:(NSString *)username
                  password:(NSString *)password
                  complete:(RWSignInResponse)completeBlock{
    
    BOOL value = username.length >3 && password.length>3;
    
    completeBlock(value);

}
@end
