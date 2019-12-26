//
//  CurrentDayViewController.swift
//  ITable
//
//  Created by Admin on 14.12.2019.
//  Copyright © 2019 amci. All rights reserved.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

/*

class CurrentDayViewController: UITableViewController {
    
    let HEADER_IDENTIFIER: String = "lessonsHeader"
    let   CELL_IDENTIFIER: String = "lessonsCell"
    
    var db: Firestore!
    
    let tableData = [
        (
            "16 December 2019", [
                Lesson(fromTime: "08.15", toTime: "09.35", subject: "Math", audience: "501"),
                Lesson(fromTime: "09.45", toTime: "11.05", subject: "Programming", audience: "254"),
                Lesson(fromTime: "11.15", toTime: "12.35", subject: "English", audience: "356")
            ]
        ),
        (
            "17 December 2019", [
                Lesson(fromTime: "11.15", toTime: "12.35", subject: "English", audience: "356"),
                Lesson(fromTime: "09.45", toTime: "11.05", subject: "Programming", audience: "254"),
                Lesson(fromTime: "08.15", toTime: "09.35", subject: "Math", audience: "501")
                
            ]
        ),
        (
            "18 December 2019", [
                Lesson(fromTime: "08.15", toTime: "09.35", subject: "Math", audience: "501"),
                Lesson(fromTime: "11.15", toTime: "12.35", subject: "English", audience: "356"),
                Lesson(fromTime: "09.45", toTime: "11.05", subject: "Programming", audience: "254")
                
            ]
        )
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UICustomCell.self, forCellReuseIdentifier: CELL_IDENTIFIER)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: HEADER_IDENTIFIER)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
        
        initDataBase()
    }
    
    
    private func initDataBase() {
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    
    // MARK: - Table View Data Source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableData.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData[section].1.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath) as! UICustomCell
        
        let lessonsInSection = tableData[indexPath.section].1
        
        cell.fromTime?.text = lessonsInSection[indexPath.row].fromTime
        
        /*
        cell.fromTime.text = lessonsInSection[indexPath.row].fromTime
        cell.toTime  .text = lessonsInSection[indexPath.row].toTime
        cell.subject .text = lessonsInSection[indexPath.row].subject
        cell.audience.text = lessonsInSection[indexPath.row].audience
        */
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HEADER_IDENTIFIER)!
        
        header.textLabel!.text = tableData[section].0
        
        return header
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
 
*/
