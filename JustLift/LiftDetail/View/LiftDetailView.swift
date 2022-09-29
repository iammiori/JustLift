//
//  LiftDetailView.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/27.
//

import SwiftUI

struct LiftDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var liftLog: LiftLog
    let viewModel: LiftDetailViewModel = LiftDetailViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    Text(viewModel.formattedDate(dateString: liftLog.date))
                        .font(.system(size: 30, weight: .bold))
                    
                        HStack {
                            Text(liftLog.condition.emoji)
                                .font(.system(size: 50))
                            IntensityListCell(liftLog: liftLog)
                                .frame(height: 60)
                        }
                    HStack {
                        Text("훈련 느낌 : \(liftLog.condition.name)")
                        Text("/ 훈련 강도 : \(liftLog.intensity.name)")
                    }
                    Text(liftLog.textLog)
                        .font(.system(size: 20, weight: .regular))
                }
                .foregroundColor(colorScheme == .dark ? .white : .black)
            }
            
            
            HStack {
                Button {
                    print("delete tapped")
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }
            }
        }
    }
}

struct LiftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LiftDetailView(liftLog: LiftLog.list.first!)
    }
}
