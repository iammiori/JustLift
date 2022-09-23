//
//  LiftLog.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/23.
//

import Foundation

struct LiftLog: Identifiable, Codable {
    var id: UUID = UUID()
    var date: String
    var textLog: String
    var condition: Condition
    var intensity: Intensity
}

extension LiftLog {
    private var dateComponent: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: self.date)
        let dc = calendar.dateComponents([.year, .month], from: date!)
        return dc
    }
    
    var monthlyIdentifier: String {
        return "\(dateComponent.year!)-\(dateComponent.month!)"
    }
}

extension LiftLog {
    static let list: [LiftLog] = [
        LiftLog(date: "2022-04-01 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity1),
        LiftLog(date: "2022-04-03 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity2),
        LiftLog(date: "2022-04-05 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity3),
        LiftLog(date: "2022-04-10 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity1),
        LiftLog(date: "2022-04-11 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity3),
        LiftLog(date: "2022-04-12 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity1),
        LiftLog(date: "2022-04-13 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity1),
        LiftLog(date: "2022-04-14 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity2),
        LiftLog(date: "2022-04-15 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity1),
        LiftLog(date: "2022-04-16 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity3),
        LiftLog(date: "2022-05-01 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity1),
        LiftLog(date: "2022-05-03 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity2),
        LiftLog(date: "2022-05-05 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity1),
        LiftLog(date: "2022-05-15 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity3),
        LiftLog(date: "2022-06-01 00:01:01", textLog: "My Diary", condition: .bad, intensity: .intensity2),
        LiftLog(date: "2022-06-03 00:01:01", textLog: "My Diary", condition: .bad, intensity: .intensity1),
        LiftLog(date: "2022-06-05 00:01:01", textLog: "My Diary", condition: .notGreat, intensity: .intensity2),
        LiftLog(date: "2022-06-15 00:01:01", textLog: "My Diary", condition: .notGreat, intensity: .intensity2),
        LiftLog(date: "2022-06-16 00:01:01", textLog: "My Diary", condition: .notGreat, intensity: .intensity1),
        LiftLog(date: "2022-06-17 00:01:01", textLog: "My Diary", condition: .notGreat, intensity: .intensity1),
        LiftLog(date: "2022-06-18 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity3),
        LiftLog(date: "2022-06-19 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity2),
        LiftLog(date: "2022-06-20 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity1),
        LiftLog(date: "2022-06-21 00:01:01", textLog: "My Diary", condition: .good, intensity: .intensity2),
        LiftLog(date: "2022-07-01 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity1),
        LiftLog(date: "2022-07-03 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity3),
        LiftLog(date: "2022-07-05 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity2),
        LiftLog(date: "2022-07-15 00:01:01", textLog: "My Diary", condition: .great, intensity: .intensity1),
    ]
}
