//
//  TimeTableViewController.swift
//  ITable
//
//  Created by Admin on 17.12.2019.
//  Copyright © 2019 amci. All rights reserved.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift



class TimeTableViewController: UITableViewController {
    
    let HEADER_IDENTIFIER: String = "lessonsHeader"
    let CELL_IDENTIFIER: String = "customCell"
    
    var db: Firestore!
    
    let formatter = DateFormatter()
    
    var data: [String: Set<Lesson>] = [:]
    
    struct Objects {
        var sectionName : String
        var sectionObjects : [Lesson]
    }
    
    var objectArray = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HEADER_IDENTIFIER)
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
        let date = Date()
        formatter.dateFormat = "dd.MM.yyyy"
        
        db.collection("timeTable").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let documentData = document.data()
                        
                        let documentDate: String = documentData["date"] as! String
                        if documentDate == self.formatter.string(from: date) {
                            let documentFromTime = documentData["fromTime"] as! String
                            let documentToTime   = documentData["toTime"]   as! String
                            let documentSubject  = documentData["subject"]  as! String
                            let documentAudience = documentData["audience"] as! String
                            
                            if self.data[documentDate] == nil {
                                self.data[documentDate] = Set<Lesson>()
                            }
                            self.data[documentDate]!.insert(Lesson(fromTime: documentFromTime, toTime: documentToTime, subject: documentSubject, audience: documentAudience))
                            print(documentDate)
                            print(Lesson(fromTime: documentFromTime, toTime: documentToTime, subject: documentSubject, audience: documentAudience))
                            print(self.data[documentDate]!)
                        }
                    }
                    for (key, value) in self.data {
                        self.objectArray.append(Objects(sectionName: key, sectionObjects: Array(value)))
                    }
                    self.tableView.reloadData()
                }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! UICustomCell
        
        let lessonsInSection = objectArray[indexPath.section].sectionObjects
        
        cell.fromTime.text = lessonsInSection[indexPath.row].fromTime
        cell.toTime  .text = lessonsInSection[indexPath.row].toTime
        cell.subject .text = lessonsInSection[indexPath.row].subject
        cell.audience.text = lessonsInSection[indexPath.row].audience
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray[section].sectionObjects.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}
