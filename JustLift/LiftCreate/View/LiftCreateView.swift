//
//  LiftCreateView.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/28.
//

import SwiftUI

struct LiftCreateView: View {
    
    @StateObject var viewModel: LiftCreateViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("start date", selection: $viewModel.date, displayedComponents: [.date])
                    .datePickerStyle(.graphical)
                Spacer()
                NavigationLink {
                    InAndConInputIvew(vm: viewModel)
                } label: {
                    Text("Next")
                }

            }
        }
    }
}

struct LiftCreateView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LiftCreateViewModel()
        LiftCreateView(viewModel: vm, isPresented: .constant(false))
    }
}
