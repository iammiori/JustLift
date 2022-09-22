//
//  Condition.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/22.
//

import Foundation

enum Condition: String, Codable, CaseIterable {
    case bad
    case notGreat
    case soso
    case good
    case great
    
    var emoji: String {
        switch self  {
        case .bad: return "🤬"
        case .notGreat: return "😢"
        case .soso: return "😑"
        case .good: return "😁"
        case .great: return "😍"
        }
    }
    
    var name: String {
        switch self  {
        case .bad: return "착한말..ㅎ"
        case .notGreat: return "맘에 안드네"
        case .soso: return "쏘쏘"
        case .good: return "좋아"
        case .great: return "갓벽"
        }
    }
}
