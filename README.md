# NotificationBug

A sample project demonstrating an iOS8 bug I [discussed](https://speakerdeck.com/sozorogami/hopperdeappleshe-yuan-gotukositemita) at [this meetup](https://github.com/potatotips/potatotips/wiki/potatotips-13) in Tokyo.

It should log four scheduled notifications to the console, but under iOS8, it will usually log three.

Changing the position of the `sleep()` call as below causes it to behave normally, strongly suggesting that async behavior is to blame.

``` obj-c
    while (YES) {
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        for (NSDate *date in [self dates]) {
            UILocalNotification *notification = [self defaultNotificationWithDate:date];
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
        sleep(2);
        NSLog(@"Notifications: %@", [UIApplication sharedApplication].scheduledLocalNotifications);
    }
```
