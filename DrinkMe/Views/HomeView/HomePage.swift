//
//  HomePage.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 13.03.2024.
//

import SwiftUI

struct HomePage: View {
    @State private var percent = 0.0
    @State private var waveOffset = Angle(degrees: 0)
    @State var waterCounting: [Double] = []
    
    var body: some View {
        VStack {
            ZStack {
                DateView()
                    .frame(height: 700, alignment: .top)
                    .font(.system(size: 40))
                    .bold()
                
                Text("\(Int(percent))%")
                    .font(.system(size: 70))
                    .fontWeight(.bold)
                    .opacity(0.5)
                
                ButtonViews(percent: $percent, waterCounting: $waterCounting)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Wave(offSet: Angle(degrees: waveOffset.degrees), percent: percent)
                .fill(Color.blue)
                .ignoresSafeArea(.all)
        )
        .background(
            Color(uiColor: .systemBackground)
                .edgesIgnoringSafeArea(.all)
        )
        .onAppear {
            withAnimation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
        .animation(.easeInOut, value: percent)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
