//
//  InAndConInputIvew.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/30.
//

import SwiftUI

struct InAndConInputIvew: View {
    
    @ObservedObject var vm: LiftCreateViewModel
    
    let conditions: [Condition] = Condition.allCases
    let intensitys: [Intensity] = Intensity.allCases
    var body: some View {
        VStack {
            Spacer()
            Text("운동 후 느낌과\n 강도를 적어주세요")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)

            HStack {
                ForEach(conditions, id:\.self) { condition in
                    Button {
                        
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
            HStack {
                ForEach(intensitys, id:\.self) { intensity in
                    Button {
                        
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
        }
    }
}

struct InAndConInputIvew_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LiftCreateViewModel()
        InAndConInputIvew(vm: vm)
    }
}
