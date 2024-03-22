//
//  UndoButton.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 13.03.2024.
//

import SwiftUI

struct UndoButton: View {
    @Binding var percent: Double
    @Binding var waterCounting: [Double]
    
    var body: some View {
        
        Button(action: {
            self.decreasePercent()
            HapticManager.instance.notification(type: .success)
        }, label: {
            Image(systemName: "arrow.uturn.backward.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 50)
                .foregroundColor(.black)
                .shadow(radius: 4, y: 4)

        })
        
    }
    func decreasePercent() {
        guard percent > 0.0 else { return }
        percent -= waterCounting.popLast() ?? 250
    }
}
