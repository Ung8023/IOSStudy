//
//  AppDelegate.swift
//  HelloWorld
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    /*
     应用启动，并进行初始化时调用，并发出通知(UIApplicationDidFinishLaunchingNotification)，这个阶段会实例化根视图控制器
     
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        NSLog("%@", "application:didFinishLaunchingWithOptions:")
        return true
    }

    /*
     应用从活动状态进入到非活动状态调用并发出通知(UIApplicationWillResignActiveNotification)
     这个阶段可以保存UI状态
     */
    func applicationWillResignActive(_ application: UIApplication) {
        NSLog("%@", "applicationWillResignActive:")
    }

    /*
     应用进入后台时调用该方法并发出通知(UIApplicationDidEnterBackgroundNotification)
     可以保存用户数据，释放一些资源
     */
    func applicationDidEnterBackground(_ application: UIApplication) {
        NSLog("%@", "applicationDidEnterBackground:")
    }

    /*
     应用进入前台时调用并发出通知(UIApplicationWillEnterForegroundNotification)
     可以保存用户数据，释放一些资源
     */
    func applicationWillEnterForeground(_ application: UIApplication) {
        NSLog("%@", "applicationWillEnterForeground:")
    }
    
    /*
     应用进入前台并处于活动状态时调用该方法，
     并发出通知(UIApplicationDidBecomeActiveNotification),
     这个阶段可以恢复UI状态
     */
    func applicationDidBecomeActive(_ application: UIApplication) {
        NSLog("%@", "applicationDidBecomeActive:")
    }

    /*
     应用被终止时调用该方法并发出通知(UIApplicationWillTerminateNotification)
     但是内存清除时除外
     这个阶段可以释放一些资源，也可以保存用户数据
     */
    func applicationWillTerminate(_ application: UIApplication) {
        NSLog("%@", "applicationWillTerminate:")
    }


}

