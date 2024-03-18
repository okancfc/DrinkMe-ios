//
//  ButtonViews.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 14.03.2024.
//

import SwiftUI

struct ButtonViews: View {
    @Binding var percent: Double
    @Binding var waterCounting: [Double]
    
    var body: some View {
        HStack {
            GlassButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 10)
            UndoButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 1)
            AddButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 1)
            BottleButton(percent: $percent, waterCounting: $waterCounting)
                .padding(.horizontal, 10)
        }
        .frame(height: 730, alignment: .bottom)
    }
}
