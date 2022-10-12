//
//  LiftListViewModel.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/23.
//

import Foundation

final class LiftListViewModel: ObservableObject {
    //MARK: TO Do : 월 구분
    @Published var liftList: [LiftLog] = LiftLog.list
    @Published var listDic: [String: [LiftLog]] = [:]
    @Published var naviTitle: String = "역도왕의 길"
    
    init() {
        self.listDic = Dictionary(grouping: self.liftList, by: { $0.monthlyIdentifier })
    }
    
    var keys: [String] {
        return listDic.keys.sorted { $0 < $1 }
    }
    
    func orderItems(_ items: [LiftLog]) -> [LiftLog] {
        return items.sorted { $0.date < $1.date }
    }
    
    func formattedSectionTitle(_ id: String) -> String {
        let dateComponents = id
            .components(separatedBy: "-")
            .compactMap{ Int($0) }
        guard let year = dateComponents.first, let month = dateComponents.last else {
            return id
        }
        
        
        let calendar = Calendar(identifier: .gregorian)
        let dateComponent = DateComponents(calendar: calendar, year: year, month: month)
        let date = dateComponent.date!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
}
