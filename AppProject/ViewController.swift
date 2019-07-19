//
//  ViewController.swift
//  AppProject
//
//  Created by girlswhocode on 7/15/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var Label: UILabel!
    
    @IBAction func Set(_ sender: Any) {
       // let answer1 = UNNotificationAction(identifier: "answer1", title: "365", options: UNNotificationActionOptions.foreground)
       // let answer2 = UNNotificationAction(identifier: "answer2", title: "366", options: UNNotificationActionOptions.foreground)
        //let category = UNNotificationCategory(identifier: "myCategory", actions: [answer1,answer2], intentIdentifiers:[],options:[])
        //UNUserNotificationCenter.current().setNotificationCategories([category])
        
        //created notification
        let content = UNMutableNotificationContent()
        content.title = "Medication!"
        content.body = "It's time to take your medicine."
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: timePicker.date )
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        //asked for permission
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    @IBAction func datePickerAction(_ sender: Any) {
        datePickerChanged(datePicker: timePicker)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        // Do any additional setup after loading the view.
    }
 
    
    func datePickerChanged(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        let strdate = dateFormatter.string(from: datePicker.date)
        Label.text = strdate
        
    }

}
