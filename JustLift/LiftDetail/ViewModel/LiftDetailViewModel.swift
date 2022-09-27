//
//  LiftDetailViewModel.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/27.
//

import Foundation

final class LiftDetailViewModel {
    func formattedDate(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: dateString)
        
        formatter.dateFormat = "yyyy.MMM.d EEE"
        return formatter.string(from: date!)
    }
}
