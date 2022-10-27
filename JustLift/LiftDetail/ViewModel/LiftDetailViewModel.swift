//
//  LiftDetailViewModel.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/27.
//

import Foundation
import SwiftUI

final class LiftDetailViewModel: ObservableObject {
    
    @Published var liftLogs: Binding<[LiftLog]>
    @Published var liftLog: LiftLog
    
    init(liftLogs: Binding<[LiftLog]>, liftLog: LiftLog) {
        self.liftLogs = liftLogs
        self.liftLog = liftLog
    }
    
    func formattedDate(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: dateString)
        
        formatter.dateFormat = "yyyy.MMM.d EEE"
        return formatter.string(from: date!)
    }
}
