//
//  SSBaseViewController.m
//  Sensor
//
//  Created by xiaodongdan on 2017/10/23.
//  Copyright © 2017年 xiaodongdan. All rights reserved.
//

#import "SSBaseViewController.h"
#import "IQKeyboardManager.h"

@interface SSBaseViewController ()

@end

@implementation SSBaseViewController

-(UINavigationController*)mainNavigationController{
    return (UINavigationController*)((AppDelegate*)[UIApplication sharedApplication].delegate).window.rootViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor hxStringToColor:@"f1f1f1"];
    
    self.sessionManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [SSHTTPManager sharedManager].sessionManager = self.sessionManager;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
   
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hiddenTabBar];
}

/**
 *  视图即将消失时把所有的请求取消掉
 *
 */
- (void)cancelTasks {
    NSArray *tasks = [self.sessionManager tasks];
    for (NSURLSessionDataTask *task in tasks) {
        [task cancel];
    }
}

- (void)addLeftBarButtonItemWithTitle:(NSString *)title block:(leftBarButtonItemTapBlock)block {
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(leftBarTaped)];
    _leftBlock = block;
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)addRightBarButtonItemWithTitle:(NSString *)title block:(rightBarButtonItemTapBlock)block {
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightBarTaped)];
    _rightBlock = block;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)addLeftBarButtonItemWithImageName:(NSString *)imageName block:(leftBarButtonItemTapBlock)block {
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarTaped)];
    _leftBlock = block;
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

- (void)addRightBarButtonItemWithImageName:(NSString *)imageName block:(rightBarButtonItemTapBlock)block {
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarTaped)];
    _rightBlock = block;
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)leftBarTaped {
    if (_leftBlock) {
        _leftBlock();
    }
}

- (void)rightBarTaped {
    if (_rightBlock) {
        _rightBlock();
    }
}

- (void)backButtonTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
