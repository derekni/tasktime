//
//  AppDelegate.swift
//  Habit Monitor
//
//  Created by Whip Master on 3/2/18.
//  Copyright © 2018 NiLabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //points
        if let point = fetchPointsData() {
            points = point
        } else {
            points = 0
        }
        
        //tasks
        if let task = fetchTaskData() {
            tasks = task
        } else {
            tasks = [String]()
        }
        
        //habits
        if let habit = fetchHabitsData() {
            habits = habit
        } else {
            habits = [String]()
        }

        //reminders
        if let reminder = fetchReminderData() {
            reminders = reminder
        } else {
            reminders = [String]()
        }

        //rewards
        if let reward = fetchRewardsData() {
            rewards = reward
        } else {
            rewards = [String]()
        }
        if let rewardDict = fetchRewardsDictData() {
            rewardsDict = rewardDict
        } else {
            rewardsDict = [String:Int]()
        }
        
        //premium rewards
        if let premiumReward = fetchPremiumRewardsData() {
            premiumRewards = premiumReward
        } else {
            premiumRewards = [String]()
        }
        if let premiumRewardDict = fetchPremiumRewardsDictData() {
            premiumRewardsDict = premiumRewardDict
        } else {
            premiumRewardsDict = [String:Int]()
        }
 
        //rewards
        /*
        rewards = ["Watch anime","Watch YouTube", "Buy bubble tea","Eat ramen","Eat fast food","Chillax"]
        rewardsDict = [
            "Watch anime": 1,
            "Watch YouTube": 1,
            "Buy bubble tea": 1,
            "Eat ramen": 1,
            "Eat fast food": 2,
            "Chillax": 2
        ]
        saveRewardsData(rewards: rewards)
        saveRewardsDictData(rewardsDict: rewardsDict)

        premiumRewards = ["Watch a movie", "Anime binge session"]
        premiumRewardsDict = [
            "Watch a movie": 5,
            "Anime binge session": 5
        ]
        savePremiumRewardsData(premiumRewards: premiumRewards)
        savePremiumRewardsDictData(premiumRewardsDict: premiumRewardsDict)
        */
        
        //savings
        if let saving = fetchSavingsData() {
            savings = saving
        } else {
            savings = 0
        }
        
        //history
        if let hist = fetchHistoryData() {
            history = hist
        } else {
            history = [[String]]()
        }
        
        //resolutions
        if let resolution = fetchResolutionData() {
            resolutions = resolution
        } else {
            resolutions = [String]()
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        savePointsData(points: points!)
        saveTaskData(tasks: tasks!)
        saveSavingsData(savings: savings!)
        saveReminderData(reminders: reminders!)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        savePointsData(points: points!)
        saveTaskData(tasks: tasks!)
        saveSavingsData(savings: savings!)
        saveReminderData(reminders:reminders!)
    }

}

