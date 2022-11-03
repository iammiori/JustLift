//
//  LiftDetailView.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/27.
//

import SwiftUI

struct LiftDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    //var liftLog: LiftLog
    //let viewModel: LiftDetailViewModel = LiftDetailViewModel()
    @StateObject var viewModel: LiftDetailViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 50) {
                    Text(viewModel.formattedDate(dateString: viewModel.liftLog.date))
                        .font(.system(size: 30, weight: .bold))
                    
                        HStack {
                            Text(viewModel.liftLog.condition.emoji)
                                .font(.system(size: 50))
                            IntensityListCell(liftLog: viewModel.liftLog)
                                .frame(height: 60)
                        }
                    HStack {
                        Text("훈련 느낌 : \(viewModel.liftLog.condition.name)")
                        Text("/ 훈련 강도 : \(viewModel.liftLog.intensity.name)")
                    }
                    Text(viewModel.liftLog.textLog)
                        .font(.system(size: 20, weight: .regular))
                }
                .foregroundColor(colorScheme == .dark ? .white : .black)
            }
            
            
            HStack {
                Button {
                    //print("delete tapped")
                    viewModel.delete()
                } label: {
                    Image(systemName: "trash")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct LiftDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LiftDetailViewModel(liftLogs: .constant(LiftLog.list), liftLog: LiftLog.list.first!)
        LiftDetailView(viewModel: vm)
    }
}
