//
//  NSObject+Blocks.h
//  MemoryManagingProj
//
//  Created by Rustam N on 14.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Blocks)

- (void)getArrayWithoutDuplicateItems:(NSArray *)arr withBlock:(void(^)(NSArray* secondArr))completionBlock;
- (void)swapping:(int)index toIndex:(int)to withBlock:(void(^)(NSArray*arr))completionBlock errorBlock:(void(^)(NSString *error))errors;
- (void)checkArray:(void(^)(int count, NSString *elemnts))success failureBlock:(void(^)(NSString *error))failure;
@end
