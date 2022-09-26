//
//  JustLiftApp.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/22.
//

import SwiftUI

@main
struct JustLiftApp: App {
    var body: some Scene {
        WindowGroup {
            let vm = LiftListViewModel()
            LiftListView(viewModel: vm)
        }
    }
}
