//
//  LiftCreateView.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/28.
//

import SwiftUI

struct LiftCreateView: View {
    
    @StateObject var viewModel: LiftCreateViewModel
    
    var body: some View {
        VStack {
            DatePicker("start date", selection: $viewModel.date, displayedComponents: [.date])
                .datePickerStyle(.graphical)
            Spacer()
        }
    }
}

struct LiftCreateView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LiftCreateViewModel(isPresented: .constant(false))
        LiftCreateView(viewModel: vm)
    }
}
