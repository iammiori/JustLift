//
//  Intensity.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/23.
//

import Foundation

enum Intensity: String, Codable, CaseIterable {
    case intensity1
    case intensity2
    case intensity3
    
    var defaultSFName: String {
        switch self {
        case .intensity1: return "1.square"
        case .intensity2: return "2.square"
        case .intensity3: return "3.square"
        }
    }
    
    var clickedSFName: String {
        switch self {
        case .intensity1: return "1.square.fill"
        case .intensity2: return "2.square.fill"
        case .intensity3: return "3.square.fill"
        }
    }
    
    var name: String {
        switch self {
        case .intensity1: return "쉬움"
        case .intensity2: return "보통"
        case .intensity3: return "빡셈"
        }
    }
}
