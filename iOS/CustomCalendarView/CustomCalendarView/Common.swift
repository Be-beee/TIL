//
//  Common.swift
//  CustomCalendarView
//
//  Created by 서보경 on 2021/09/02.
//

import UIKit

enum Week: String {
    case mon = "Mon"
    case tue = "Tue"
    case wed = "Wed"
    case thu = "Thu"
    case fri = "Fri"
    case sat = "Sat"
    case sun = "Sun"
}

// calendar 날짜, 요일 설정
struct CalendarFormat {
    var year: String
    var month: String
    var datelist: [(date: Int, week: Week)]
    
    init() {
        let dateformatter = DateFormatter()
        let today = Date()
        
        dateformatter.dateFormat = "yyyy"
        self.year = dateformatter.string(from: today)
        
        dateformatter.dateFormat = "MM"
        self.month = dateformatter.string(from: today)
        
        dateformatter.dateFormat = "EEE"
        let todaysweek = dateformatter.string(from: today)
        // (날짜, 요일) 리스트 추가
        self.datelist = []
    }
    
    init(year: String, month: String) {
        self.year = year
        self.month = month
        self.datelist = []
    }
}
