//
//  LessonTimeTable.swift
//  ITable
//
//  Created by Admin on 14.12.2019.
//  Copyright © 2019 amci. All rights reserved.
//

import Foundation

struct Lesson : Hashable {
    let fromTime: String
    let toTime  : String
    let subject : String
    let audience: String
    
    init(fromTime: String,
         toTime: String,
         subject: String,
         audience: String)
    {
        self.fromTime = fromTime
        self.toTime = toTime
        self.subject = subject
        self.audience = audience
    }
}

extension Lesson: Comparable {
    static func < (lhs: Lesson, rhs: Lesson) -> Bool {
          return lhs.fromTime < rhs.fromTime
    }
}
