//
//  LiftlogStorage.swift
//  JustLift
//
//  Created by miori Lee on 2022/10/17.
//

import Foundation

final class LiftlogStorage {
    
    func persist(_ items: [LiftLog]) {
        Storage.store(items, to: .documents, as: "liftlog_list.json")
    }
    
    func fetch() -> [LiftLog] {
        let list = Storage.retrive("liftlog_list.json", from: .documents, as: [LiftLog].self) ?? []
        return list
    }
}
