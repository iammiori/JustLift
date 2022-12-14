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
        case .bad: return "đ¤Ź"
        case .notGreat: return "đ˘"
        case .soso: return "đ"
        case .good: return "đ"
        case .great: return "đ"
        }
    }
    
    var name: String {
        switch self  {
        case .bad: return "ě°Šíë§..ă"
        case .notGreat: return "ë§ě ěëë¤"
        case .soso: return "ěě"
        case .good: return "ě˘ě"
        case .great: return "ę°ë˛˝"
        }
    }
}
