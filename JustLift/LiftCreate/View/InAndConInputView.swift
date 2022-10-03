//
//  InAndConInputIvew.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/30.
//

import SwiftUI

struct InAndConInputView: View {
    
    @ObservedObject var vm: LiftCreateViewModel
    
    let conditions: [Condition] = Condition.allCases
    let intensitys: [Intensity] = Intensity.allCases
    var body: some View {
        VStack {
            Spacer()
            Text("운동 후 \"컨디션\"과\n \"강도\"를 체크해주세요")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(.bottom, 35)
            
            HStack {
                ForEach(conditions, id:\.self) { condition in
                    Button {
                        vm.condition = condition
                    } label: {
                        VStack(alignment: .center, spacing: 1) {
                            Text(condition.emoji)
                                .font(.system(size: 35))
                                .padding()
                            Text(condition.name)
                                .foregroundColor(.black)
                                .font(.system(size: 14))
                                .padding(.bottom, 15)
                        }
                        .background(condition == vm.condition ? Color.gray.opacity(0.4) : Color.clear)
                        .cornerRadius(10)
                        
                    }
                }
            }
            .padding()
            HStack {
                ForEach(intensitys, id:\.self) { intensity in
                    Button {
                        vm.intensity = intensity
                    } label: {
                        VStack(spacing: 1) {
                            Image(systemName: intensity == vm.intensity ? intensity.clickedSFName : intensity.defaultSFName)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 45)
                                .padding()
                            Text(intensity.name)
                                .foregroundColor(.black)
                                .padding(2)
                        }
                        .padding(5)
                        .cornerRadius(10)
                    }
                }
            }
            Spacer()
            
            NavigationLink {
                if vm.checkCount {
                    LiftLogInputView(vm: vm)
                }
            } label: {
                Text("go")
            }
            
        }
    }
}

struct InAndConInputIvew_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LiftCreateViewModel()
        InAndConInputView(vm: vm)
    }
}
