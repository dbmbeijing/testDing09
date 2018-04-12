//
//  ViewController.m
//  TestRAC
//
//  Created by xdf on 2018/3/22.
//  Copyright © 2018年 xdf. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LogInSercie.h"
#import "DataModel.h"
#import <MJExtension/MJExtension.h>

#import "UIButton+touch.h"
typedef void (^RWSignInResponse)(BOOL);


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,NSURLSessionDelegate,NSURLSessionDataDelegate,NSURLSessionTaskDelegate,NSURLSessionDownloadDelegate>




@property (nonatomic, strong) UIButton *testButton;

@property (nonatomic, strong) UITextField *testTield;


@property (nonatomic, strong) UITextField *passTextField;

@property (nonatomic, strong) LogInSercie *loInSercie;


@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *array;


@property(nonatomic, strong) RACSignal *reloadDataSingal;


@property (nonatomic, assign) NSInteger count;

@end

@implementation ViewController


- (RACSignal *)reloadDataSingal
{
    if (_reloadDataSingal == nil) {
        
        _reloadDataSingal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:self.array];
            [subscriber sendCompleted];
            return nil;
            
        }];
        
    }
    
    return _reloadDataSingal;
    
}

-(NSMutableArray *)array
{
    if (_array == nil) {
        _array = [[NSMutableArray array]init];
        
        for (int i = 0; i < 5; i ++) {
            DataModel  *model = [[DataModel alloc]init];
            model.name = [NSString stringWithFormat:@"张三--%d",i];
            model.phoneNumber = [NSString stringWithFormat:@"%d",i + 145];
            [_array  addObject:model];
            
        }
    }
    return _array;
}
-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
//    NSDictionary *dict = @{
//
//                           @"count":@(33),
//
//                           @"name":@"ding",
//
//                           @"phoneNumber":@(11111),
//
//                           @"vipPrice":@(788.09)
//
//                           };
//
//
//
//
//    DataModel *modeTest = [DataModel mj_objectWithKeyValues:dict];
//
//    NSLog(@"%@",modeTest);
//
//
//
//
//    self.view.backgroundColor = [UIColor whiteColor];
//
//    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
//
//    [[[leftButton rac_signalForControlEvents:UIControlEventTouchUpInside]
//
//    doNext:^(id x) { // 没有返回值
//
//
//    }]
//
//     subscribeNext:^(id x) {
//
//         DataModel *model = [DataModel new];
//         model.name = @"34343r";
//         [self.array addObject:model];
//         NSLog(@"%zd",self.array.count);
//         self.count = self.array.count;
//
//    }];
//
//
//
//
//    [RACObserve(self, self.count) subscribeNext:^(id x) {
//
//
//        [self.tableView reloadData];
//
//    }];
//
//
//
//
//    UIBarButtonItem *leftItme = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
//    self.navigationItem.leftBarButtonItem = leftItme;
//
//    [self.view addSubview:self.tableView];
//
//
//
//    [[self.reloadDataSingal map:^id(NSMutableArray  *value) {
//
//        DataModel *model = [[DataModel alloc]init];
//        model.name = @"ding";
//        model.phoneNumber = @"12222";
//        [value addObject:model];
//        return value;
//
//    }] subscribeNext:^(id x) {
//
//        [self.tableView  reloadData];
//
//    }];
//
//
//
//    NSArray *array = @[@"1",@"3",@"3",@"6",@"1",@"9"];
//
//
//    NSString *textString = @"233344567898665545";
//
//    NSSet *stringSet = [NSSet setWithObject:textString];
//    NSSet *setTest = [NSSet setWithArray:array];
//
//    NSLog(@"测试集合==%@",setTest);
//    NSLog(@"===%@",stringSet);
//
    
    
    
    
//    NSLog(@"1"); // 任务1
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"2"); // 任务2
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"4"); // 任务4
//    });
//    NSLog(@"5"); // 任务5
//
    
    
    

//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"1"); // 任务1
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"2"); // 任务2
//        });
//        NSLog(@"3"); // 任务3
//    });
//    NSLog(@"4"); // 任务4
////    while (1) {
////    }
////    NSLog(@"5"); // 任务5
//////
//     NSLog(@"1"); // 任务1
//    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
//
//    dispatch_async(queue, ^{
////        NSLog(@"2"); // 任务2
//        dispatch_sync(queue, ^{
//            NSLog(@"3"); // 任务3
//        });
//        NSLog(@"4"); // 任务4
//    });
//    NSLog(@"5"); // 任务5
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    button.backgroundColor = [UIColor blueColor];
    
    button.isIgnore = NO;
    button.timeInterval = 3;
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}



-(void)buttonClick{
    
    NSLog(@"按钮点击了");
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellResute = @"reusluse";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellResute];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellResute];
    }
    
    
    DataModel *model = self.array[indexPath.row];
//    cell.textLabel.text = model.name;
    return cell;
    
}


-(RACSignal *) loginSignal{
    
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        
        [self.loInSercie signInWithUsername:self.testTield.text password:self.passTextField.text complete:^(BOOL value) {
            
            [subscriber sendNext:@(value)];
            
            [subscriber sendCompleted];
        }];
        
        return nil;
       
    }];
}


-(LogInSercie *)loInSercie{
    
    return  [LogInSercie new];
}
- (BOOL) isEnalbeUserName:(NSString *)text{
    
    return text.length > 5;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
