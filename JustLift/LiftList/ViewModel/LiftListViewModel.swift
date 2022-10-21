//
//  LiftListViewModel.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/23.
//

import Foundation
import Combine

final class LiftListViewModel: ObservableObject {
    
    let storage: LiftlogStorage
    
    //MARK: TO Do : 월 구분
    //LiftLog.list
    @Published var liftList: [LiftLog] = []
    @Published var listDic: [String: [LiftLog]] = [:]
    @Published var naviTitle: String = "역도왕의 길"
    
    var subscriptions = Set<AnyCancellable>()
    
    init(storage: LiftlogStorage) {
        self.storage = storage
        //self.listDic = Dictionary(grouping: self.liftList, by: { $0.monthlyIdentifier })
        bind()
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
    
    func fetch() {
        self.liftList = storage.fetch()
    }
    
    private func bind() {
        $liftList.sink { logs in
            self.listDic = Dictionary(grouping: logs, by: { $0.monthlyIdentifier })
            self.persist(logs: logs)
        }.store(in: &subscriptions)
    }
    
    private func persist(logs: [LiftLog]) {
        guard logs.isEmpty == false else { return }
        self.storage.persist(logs)
    }
}

// 데이터 파일에서 훈련 리스트 가져오기
// list에 해당 객체 세팅
// list 세팅 되면 dic도
