//
//  AppDelegate.m
//  GradientColorNav
//
//  Created by steven on 2016/12/8.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarItem.h"
#import "BaseNavigationController.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "RDPReachability.h"
#import "ScrollTableViewViewController.h"
#import "RecordViewController.h"
#import "ExpandTableViewController.h"
#import "ImagedLabelViewController.h"
#import "ImageViewController.h"


@interface AppDelegate ()

@property (nonnull, nonatomic, strong)RDPReachability *conn;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
#if 0
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers: [self setUpControllers]];
    
    [self setNetworkNotifier];
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    ScrollTableViewViewController *vc = [[ScrollTableViewViewController alloc] init];

    RecordViewController *vc = [[RecordViewController alloc] init];
#endif
    ImageViewController *vc = [[ImageViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (NSArray *)setUpControllers {
    
    ViewController *firstViewController = [[ViewController alloc] init];
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    
    BaseNavigationController *firstNavigationController = [[BaseNavigationController alloc] initWithRootViewController:firstViewController];
    BaseTabBarItem *firstTabBarItem = [[BaseTabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"twitter"] selectedImage:[UIImage imageNamed:@"twitter-selected"]];
    
    [firstNavigationController setTabBarItem:firstTabBarItem];
    
    BaseNavigationController *secondNavigationController = [[BaseNavigationController alloc] initWithRootViewController:secondViewController];
    BaseTabBarItem *secondTabBarItem = [[BaseTabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"tumblr"] selectedImage:[UIImage imageNamed:@"tumblr-selected"]];
    
    [secondNavigationController setTabBarItem:secondTabBarItem];
    
    BaseNavigationController *thirdNavigationController = [[BaseNavigationController alloc] initWithRootViewController:thirdViewController];
    BaseTabBarItem *thirdTabBarItem = [[BaseTabBarItem alloc] initWithTitle:@"" image:[UIImage imageNamed:@"pinterest"] selectedImage:[UIImage imageNamed:@"pinterest-selected"]];
    
    [thirdNavigationController setTabBarItem:thirdTabBarItem];
    
    return [NSArray arrayWithObjects:firstNavigationController, secondNavigationController, thirdNavigationController, nil];
    
}

#pragma mark - set network notifier
- (void)setNetworkNotifier {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(checkNetworkState)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    self.conn = [RDPReachability reachabilityForInternetConnection];
    [self.conn startNotifier];
}

#pragma mark - view network state change
- (void)checkNetworkState {
    // Check wifi
    RDPReachability *wifi = [RDPReachability reachabilityForLocalWiFi];
    
    // If has network (2G/3G..)
    RDPReachability *conn = [RDPReachability reachabilityForInternetConnection];
    
    if ([wifi currentReachabilityStatus] != NotReachable) {
        NSLog(@"has wifi");
    } else if ([conn currentReachabilityStatus] != NotReachable) {
        NSLog(@"has network");
    } else {
        NSLog(@"No network");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self.conn stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
