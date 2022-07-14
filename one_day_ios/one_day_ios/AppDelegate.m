//
//  AppDelegate.m
//  one_day_ios
//
//  Created by 王阳 on 2021/4/1.
//
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>
#import "AppDelegate.h"
#import "RegisterApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"my flutter engine"];
      // Runs the default Dart entrypoint with a default Flutter route.
    [self.flutterEngine run];
      // Used to connect plugins (only if you have plugins with iOS platform code).
    FlutterMethodChannel* netWorkChannel=[FlutterMethodChannel methodChannelWithName:@"native_network" binaryMessenger:self.flutterEngine.binaryMessenger];
    [netWorkChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([@"get" isEqualToString:call.method]) {
                    NSDictionary *args = call.arguments;
                    RegisterApi *api = [[RegisterApi alloc] initWithUrl:args[@"url"] ];
                           [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
                               NSLog(@"succeed");
                               result(request.responseString);
                           } failure:^(YTKBaseRequest *request) {
                               // 你可以直接在这里使用 self
                               NSLog(@"failed");
                               result([FlutterError errorWithCode:@"UNAVAILABLE"
                                                               message:@"请求错误"
                                                               details:nil]);
                           }];
                }
       }];
       
       FlutterMethodChannel* logChannel=[FlutterMethodChannel methodChannelWithName:@"native_log" binaryMessenger:self.flutterEngine.binaryMessenger];
       [logChannel setMethodCallHandler:^(FlutterMethodCall *  call, FlutterResult   result) {
           NSDictionary *args = call.arguments;
           NSString* tag=args[@"tag"];
           NSString* msg=args[@"msg"];
           if ([@"logD" isEqualToString:call.method]) {
               NSLog(@"debug tag:%@  msg:%@",tag,msg);
           }else{
                NSLog(@"normal tag:%@  msg:%@",tag,msg);
           }
       }];
    
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
      return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
