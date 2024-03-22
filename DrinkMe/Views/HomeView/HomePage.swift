//
//  HomePage.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 13.03.2024.
//

import SwiftUI

struct HomePage: View {
    @AppStorage("percent") private var percent = 0.0
    @State private var waveOffset = Angle(degrees: 0)
    @State var waterCounting: [Double] = []
    @AppStorage("waterLimitInput") private var waterLimitInput: Double = 3000.0
    
    var body: some View {
        VStack {
            ZStack {
                MotivationMessage()
                    .opacity(0.6)
                VStack {
                    HStack {
                        HStack {
                            Text("💧")
                                .font(.title2)
                                .padding(.horizontal, -10)
                            
                            Text("\(percent / 1000,specifier: "%.2f")L")
                                .font(.title)
                            
                        }
                        Spacer()
                        DateView()
                            .font(.system(size: 40))
                            .bold()
                        Spacer()
                        Spacer()
                        AmountOfWatterButton(waterLimitInput: $waterLimitInput)
                    }
                    .padding()
                    Spacer()
                }
               
                ButtonViews(percent: $percent, waterCounting: $waterCounting)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Wave(waterLimitInput: waterLimitInput, offSet: Angle(degrees: waveOffset.degrees), percent: percent)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.white, Color(#colorLiteral(red: 0.2133937478, green: 0.5015463233, blue: 0.9232358336, alpha: 1)), .blue]), startPoint: .top, endPoint: .bottom)
                            .mask(Wave(waterLimitInput: waterLimitInput, offSet: Angle(degrees: waveOffset.degrees), percent: percent))
                    )
                .ignoresSafeArea(.all)
        )
        .background(
            Color(uiColor: .systemBackground)
                .edgesIgnoringSafeArea(.all)
            
        )
        .onReceive(Timer.publish(every: 60, on: .current, in: .default).autoconnect()) { _ in
            let date = Date()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: date)
            let minutes = calendar.component(.minute, from: date)
            
            if hour == 14 && minutes == 28 {
                percent = 0.0
            }
        }
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
