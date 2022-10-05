//
//  LiftLogInputView.swift
//  JustLift
//
//  Created by miori Lee on 2022/10/01.
//

import SwiftUI

struct LiftLogInputView: View {
    
    @ObservedObject var vm: LiftCreateViewModel
    @FocusState var isfocused: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $vm.logText)
                .focused($isfocused)
                .border(.blue.opacity(0.2), width: 2)
        }
        .padding()
        .onAppear {
            isfocused = true
        }
    }
}

struct LiftLogInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm: LiftCreateViewModel = LiftCreateViewModel()
        LiftLogInputView(vm: vm)
    }
}
