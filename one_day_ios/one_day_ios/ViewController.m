//
//  ViewController.m
//  one_day_ios
//
//  Created by 王阳 on 2021/4/1.
//
@import Flutter;
#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(showFlutter)
           forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show Flutter!" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.blueColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}

- (void)showFlutter {
    FlutterEngine *flutterEngine =
            ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
        FlutterViewController *flutterViewController =
            [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
        [self presentViewController:flutterViewController animated:YES completion:nil];
}

@end
