//
//  RemindersManager.swift
//  Geofencing
//
//  Created by Hesham Abd-Elmegid on 3/23/17.
//  Copyright © 2017 CareerFoundry. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RemindersManager: NSObject {

    static let shared = RemindersManager()
    let userDefaultsKey = "RemindersUserDefaultsKey"
        
    func reminders() -> [Reminder] {
        if let remindersData  = UserDefaults.standard.object(forKey: userDefaultsKey) as? Data {
            let reminders = NSKeyedUnarchiver.unarchiveObject(with: remindersData) as! [Reminder]
            
            return reminders
        }
        
        return [Reminder]()
    }
    
    func add(reminder: Reminder) {
        var reminders = self.reminders()
        reminders.append(reminder)
        
        let remindersData = NSKeyedArchiver.archivedData(withRootObject: reminders)
        UserDefaults.standard.set(remindersData, forKey: userDefaultsKey)
        UserDefaults.standard.synchronize()
    }
    
    func delete(reminderAtIndex index: Int) {
        var reminders = self.reminders()
        reminders.remove(at: index)
        
        let remindersData = NSKeyedArchiver.archivedData(withRootObject: reminders)
        UserDefaults.standard.set(remindersData, forKey: userDefaultsKey)
        UserDefaults.standard.synchronize()
    }
    
}
