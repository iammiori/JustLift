//
//  LiftCreateViewModel.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/28.
//

import Foundation
import Combine

final class LiftCreateViewModel: ObservableObject {
    
    @Published var liftLog: LiftLog
    
    @Published var date: Date = Date()
    @Published var condition: Condition
    @Published var intensity: Intensity
    @Published var logText: String = ""
    @Published var checkCount: Bool
    
    var subscriptions = Set<AnyCancellable>()
    
    init(condition: Condition = .soso, intensity: Intensity = .intensity2, checkCount: Bool = true) {
        self.condition = condition
        self.intensity = intensity
        self.checkCount = checkCount
        self.liftLog = LiftLog(date: "", textLog: "", condition: condition, intensity: intensity)
        
        $date.sink { date in
            //date
            self.update(date: date)
        }.store(in: &subscriptions)
        
        $condition.sink { condition in
            self.update(condition: condition)
        }.store(in: &subscriptions)
        
        $intensity.sink { intensity in
            self.update(intensity: intensity)
        }.store(in: &subscriptions)
        
        $logText.sink { logText in
            self.update(logText: logText)
        }.store(in: &subscriptions)
    }
    
    private func update(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.liftLog.date = formatter.string(from: date)
    }
    
    private func update(condition: Condition) {
        self.liftLog.condition = condition
    }
    
    private func update(intensity: Intensity) {
        self.liftLog.intensity = intensity
    }
    
    private func update(logText: String) {
        self.liftLog.textLog = logText
    }
    
    func finishWriting(completion: @escaping () -> Void) {
        guard liftLog.date.isEmpty == false else { return }
    }
}
