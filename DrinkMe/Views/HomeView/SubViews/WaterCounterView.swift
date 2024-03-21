//
//  ConsumedWaterView.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 20.03.2024.
//

import SwiftUI


struct WaterCounterView: View {
    var percent: Double
    
    var body: some View {
        VStack{
            Image(systemName: "water.waves")
                .font(.system(size: 70))
                .foregroundColor(.black)
                .font(.largeTitle)
                .bold()
            Text("\(percent / 1000,specifier: "%.2f")L")
        }
    }
    
}

#Preview {
    WaterCounterView(percent: .zero)
}
