//
//  wake-up bedtime viewController.swift
//  AppProject
//
//  Created by girlswhocode on 7/18/19.
//  Copyright © 2019 girlswhocode. All rights reserved.
//

import UIKit
import UserNotifications
class wake_up_bedtime_viewController: UIViewController {

    
    @IBOutlet weak var datePicker1: UIDatePicker!
    
    @IBOutlet weak var label1: UILabel!
    @IBAction func datePicker1act(_ sender: Any) {
         datePickerChanged(datePicker: datePicker1)
    }
    
  
    
    @IBAction func Set1(_ sender: Any) {
        //created notification
        let content1 = UNMutableNotificationContent()
        content1.title = "Good morning!"
        content1.body = "It's time to wake up."
        content1.sound = UNNotificationSound.default
        content1.badge = 1
        
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker1.date )
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content1, trigger: trigger)
        //asked for permission
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
   
    @IBOutlet weak var datePicker2: UIDatePicker!
    
    @IBAction func datePicker2act(_ sender: Any) {
         datePickerChanged(datePicker: datePicker1)
    }
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBAction func Set2(_ sender: Any) { //created notification
        let content = UNMutableNotificationContent()
        content.title = "Time for bed!"
        content.body = "It's time to go to sleep."
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker2.date )
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        //asked for permission
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})

        // Do any additional setup after loading the view.
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
func datePickerChanged(datePicker:UIDatePicker){
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.short
    let strdate = dateFormatter.string(from: datePicker.date)
    label1.text = strdate
    
}
}

