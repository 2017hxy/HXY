//
//  ViewController.m
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 贺心元. All rights reserved.
//

#import "ViewController.h"
#import "AllCategoryListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)goToCateVC:(id)sender {
    
    AllCategoryListViewController *vc = [[AllCategoryListViewController alloc] init];
    [self.navigationController pushViewController:vc  animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
