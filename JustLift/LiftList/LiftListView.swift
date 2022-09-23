//
//  LiftListView.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/22.
//

import SwiftUI

struct LiftListView: View {
    
    @State var list: [LiftLog] = LiftLog.list
    let layout: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach(list) { item in
                HStack {
                    Text(item.condition.emoji)
                    IntensityListCell(liftLog: item)
                        .frame(height: 30)
                }

            }
        }
    }
}

struct LiftListView_Previews: PreviewProvider {
    static var previews: some View {
        LiftListView()
    }
}
