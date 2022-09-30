//
//  LiftCreateViewModel.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/28.
//

import Foundation
import SwiftUI

final class LiftCreateViewModel: ObservableObject {
    
    @Published var date: Date = Date()
    @Published var condition: Condition = .soso
    @Published var intensity: Intensity = .intensity2
    init() {
    }
}
