//
//  NSObject+Blocks.m
//  MemoryManagingProj
//
//  Created by Rustam N on 14.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "NSObject+Blocks.h"

@implementation NSArray (Blocks)

-(void)getArrayWithoutDuplicateItems:(NSArray *)arr withBlock:(void(^)(NSArray* secondArr))completionBlock{
    NSMutableArray *sumArr   = [NSMutableArray new];
    NSMutableArray *resultArr = [NSMutableArray new];
    bool newItim;
    
    [sumArr addObjectsFromArray:arr];
    [sumArr addObjectsFromArray:self];
    
    for(int i = 0; i < sumArr.count; i++){
        newItim = true;
        for(int j = 0; j < sumArr.count-1; j++){
            if([[sumArr objectAtIndex:i]isEqual:[sumArr objectAtIndex:j]] && i!=j){
                newItim = false;
            }
        }
        if(newItim){
            [resultArr addObject:[sumArr objectAtIndex:i]];
        }
    }
    completionBlock([NSArray arrayWithArray:resultArr]);
}



- (void)swapping:(int)index toIndex:(int)to withBlock:(void(^)(NSArray*arr))completionBlock errorBlock:(void(^)(NSString *errorMessage))error{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:self];
    
    if(to < arr.count && index < arr.count){
        [arr exchangeObjectAtIndex:index withObjectAtIndex:to];
        completionBlock([NSArray arrayWithArray:arr]);
    }
    error(@"Error, wrong date");
}




- (void)checkArray:(void(^)(int count, NSString *elemnts))success failureBlock:(void(^)(NSString *error))failure{
    NSString *result = @"";
    if(self != nil){
        for(int i = 0; i < self.count; i++){
            if([self objectAtIndex:i] != nil){
                result = [NSString stringWithFormat:@"%@, %i: %@",result, i, [self objectAtIndex:i]];
            }
            else{
                failure([NSString stringWithFormat:@"%i: nil", i]);
            }
        }
        success((int)self.count, result);
    }
    failure(@"Array nil");
}

@end
