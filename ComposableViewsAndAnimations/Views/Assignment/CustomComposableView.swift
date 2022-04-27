//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    // MARK: Stored Properties
    // Control the horizontal offset - 1st circle
    @State private var offsetX = 20.0
    
    // Control the horizontal offset - 2nd circle
    @State private var offsetA = -20.0
    
    // Control the colour - 1st circle
    @State private var circleOneColor: Color = .yellow
    
    // Control the colour - 2nd circle
    @State private var circleTwoColor: Color = .orange
    
    // Control the rotation angle
    @State private var currentRotationAngle = Angle.degrees(0)
    
    let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()

    // MARK: Computed Properties
    var body: some View {
        
        VStack {
            
            Text("Loading...")
                .font(Font.custom("SF Compact", size: 25.0))
                .foregroundColor(circleOneColor)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(circleOneColor)
                .offset(x: offsetX, y: 0)
                .onReceive(timer) { input in
                    
                    offsetX = 100.0
                    
                    circleOneColor = .orange
                    
                    // Stop the timer
                    timer.upstream.connect().cancel()
                }
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(circleTwoColor)
                .offset(x: offsetA, y: 0.0)
                .onReceive(timer) { input in

                    offsetA = -100.0

                    circleTwoColor = .red

                    // Stop the timer
                    timer.upstream.connect().cancel()
                }
                
        }
        .animation(
            Animation.easeOut(duration: 1.0)
                .repeatForever(autoreverses: true)
        )
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
