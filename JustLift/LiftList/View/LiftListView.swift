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
    @State private var isPresnting: Bool = false
    
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
                                    
                                    NavigationLink {
                                        LiftDetailView(liftLog: item)
                                    } label: {
                                        HStack {
                                            Text(item.condition.emoji)
                                            IntensityListCell(liftLog: item)
                                                .frame(height: 20)
                                        }
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
                        isPresnting = true
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
            .onAppear(perform: {
                #if DEBUG
                viewModel.naviTitle = "역도왕의길 dev"
                #else
                #endif
            })
            .navigationTitle(viewModel.naviTitle)
        }
        .sheet(isPresented: $isPresnting) {
            let vm = LiftCreateViewModel()
            LiftCreateView(viewModel: vm, isPresented: $isPresnting)
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct LiftListView_Previews: PreviewProvider {
    static var previews: some View {
        LiftListView(viewModel: LiftListViewModel(storage: LiftlogStorage()))
    }
}
