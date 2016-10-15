//
//  ViewController.m
//  MemoryManagingProj
//
//  Created by Ildar Zalyalov on 01.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Blocks.h"

@interface ViewController ()
@property (strong, atomic) NSArray *arr;
@property (strong, atomic) NSString *string;
@property (nonatomic) int number;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array1 = @[@1 ,@1, @5, @5, @100, @2, @7, @4];
    NSArray *array2 = @[@1 ,@2, @3, @4, @5, @20, @70, @40];
    
    [array1 getArrayWithoutDuplicateItems:array2 withBlock:^(NSArray *secondArr) {
        NSLog(@"%@", secondArr);
    }];
    
    
    [array2 swapping:100 toIndex:1 withBlock:^(NSArray *arr) {
        NSLog(@"%@",arr);
    } errorBlock:^(NSString *error) {
        NSLog(@"%@", error);
    }];
    
    
    [array2 checkArray:^(int count, NSString *elemnts) {
        NSLog(@"count: %d%@", count, elemnts);
    } failureBlock:^(NSString *error) {
        NSLog(@"%@", error);
    }];
    
    
    self.number = -340;
    NSLog(@"%d", _number);
}

- (NSString*)getString{
    @synchronized (self) {
        if(!_string){
            _string = [NSString new];
        }
    }
    return _string;
}
- (void)setString:(NSString *)string{
    @synchronized (self) {
        _string = string;
    }
}

- (NSArray*)getArr{
    @synchronized (self){
        if(!_arr){
            _arr = [NSArray new];
        }
    }
    return _arr;
}
- (void)setArr:(NSArray *)arr{
    @synchronized (self){
        _arr = arr;
    }
}

- (void)setNumber:(int)number{
    if(number < 0)
        _number = 0;
    else
        _number = number;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

