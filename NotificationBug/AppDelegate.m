//
//  AppDelegate.m
//  NotificationBug
//
//  Created by Tyler Tape on 12/12/14.
//  Copyright (c) 2014 sozorogami. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }

    while (YES) {
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        for (NSDate *date in [self dates]) {
            UILocalNotification *notification = [self defaultNotificationWithDate:date];
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
        NSLog(@"Notifications: %@", [UIApplication sharedApplication].scheduledLocalNotifications);
        sleep(2);
    }

    return YES;
}

- (NSArray *)dates {
    return @[[NSDate dateWithTimeIntervalSinceNow:10000],
             [NSDate dateWithTimeIntervalSinceNow:20000],
             [NSDate dateWithTimeIntervalSinceNow:30000],
             [NSDate dateWithTimeIntervalSinceNow:40000]
             ];
}

- (UILocalNotification *)defaultNotificationWithDate:(NSDate *)date {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = date;
    notification.alertBody = @"meow";
    return notification;
}

@end
