//
//  LiftListView.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/22.
//

import SwiftUI

struct LiftListView: View {
    
    //@State var list: [LiftLog] = LiftLog.list
    @StateObject var viewModel: LiftListViewModel
    
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: layout) {
                        ForEach(viewModel.keys, id: \.self) { key in
                            Section {
                                let items = viewModel.listDic[key] ?? []
                                let orderedItmes = viewModel.orderItems(items)
                                ForEach(orderedItmes) { item in
                                    HStack {
                                        Text(item.condition.emoji)
                                        IntensityListCell(liftLog: item)
                                            .frame(height: 20)
                                    }
                                    
                                }
                            } header: {
                                Text(viewModel.formattedSectionTitle(key))
                                    .font(.headline)
                            }
                            .frame(height: 60)
                            
                        }
                    }
                }
                HStack {
                    Button {
                        print("plus btn tapped")
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    }
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(40)
                }
            }
            .navigationTitle("역도왕의 길")
        }
    }
}

struct LiftListView_Previews: PreviewProvider {
    static var previews: some View {
        LiftListView(viewModel: LiftListViewModel())
    }
}
