//
//  BottleButton.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 13.03.2024.
//

import SwiftUI

struct BottleButton: View {
    @Binding var percent: Double
    @Binding var waterCounting: [Double]
    
    var body: some View {

        Button(action: {
            self.incrementPercent()
        }, label: {
            ZStack {
                VStack {
                    Image("bottle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        
                    
                    Text("500ml")
                }
                .foregroundColor(.black)
                
                RoundedRectangle(cornerRadius: 17)
                    .stroke(Color.black, lineWidth: 4)
                    .frame(width: 100, height: 95)
                    .shadow(radius: 4, y: 4)
            }
        })
    }
    func incrementPercent() {
        percent += 500.0
        waterCounting.append(500.0)
    }
}
