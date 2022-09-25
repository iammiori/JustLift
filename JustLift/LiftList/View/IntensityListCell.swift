//
//  IntensityListCell.swift
//  JustLift
//
//  Created by miori Lee on 2022/09/23.
//

import SwiftUI

struct IntensityListCell: View {
    
    var liftLog: LiftLog
    var body: some View {
        Image(systemName: liftLog.intensity.defaultSFName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ConditionListCell_Previews: PreviewProvider {
    static var previews: some View {
        IntensityListCell(liftLog: LiftLog.list.first!)
    }
}

