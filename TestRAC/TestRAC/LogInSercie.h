//
//  LogInSercie.h
//  TestRAC
//
//  Created by xdf on 2018/3/22.
//  Copyright © 2018年 xdf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RWSignInResponse)(BOOL);


@interface LogInSercie : NSObject

- (void)signInWithUsername:(NSString *)username
                  password:(NSString *)password
                  complete:(RWSignInResponse)completeBlock;
@end
