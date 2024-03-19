//
//  GlassButton.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 13.03.2024.
//

import SwiftUI

struct GlassButton: View {
    @Binding var percent: Double
    @Binding var waterCounting: [Double]
   
    
    var body: some View {
        
            Button(action: {
                self.incrementPercent()
                print(percent)
            }, label: {
                ZStack {
                    VStack {
                        Image("glass")
                        
                        Text("250ml")
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
        percent += 250.0
        waterCounting.append(250.0)
    }
}
