//
//  WaveAnimation.swift
//  DrinkMe
//
//  Created by Okan Çifçi on 13.03.2024.
//

import SwiftUI

struct Wave: Shape {
    var waterLimitInput: Double?
    
    var offSet: Angle
    var percent: Double
    
    var animatableData: AnimatablePair<Double, Double> {
            get {
                AnimatablePair(offSet.degrees, percent)
            }
            set {
                offSet = Angle(degrees: newValue.first)
                percent = newValue.second
            }
        }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let lowestWave = 0.02
        let highestWave = 1.00
        
        let newPercent = lowestWave + (highestWave - lowestWave) * (percent / (waterLimitInput ?? 3000.0))
        let waveHeight = 0.015 * rect.height
        let yOffSet = max(CGFloat(1 - newPercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight, 60)
        let startAngle = offSet
        let endAngle = offSet + Angle(degrees: 360 + 10)
        p.move(to: CGPoint(x: 0, y: yOffSet + waveHeight * CGFloat(sin(offSet.radians))))
        
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
                p.addLine(to: CGPoint(x: x, y: yOffSet + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
            p.addLine(to: CGPoint(x: rect.width, y: rect.height))
            p.addLine(to: CGPoint(x: 0, y: rect.height))
            p.closeSubpath()
              
        return p
    }
}


