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
    @State private var offsetX = 24.0
    
    // Control the horizontal offset - 2nd circle
    @State private var offsetA = -24.0
    
    // Control the colour - 1st circle
    @State private var circleOneColor: Color = .yellow
    
    // Control the colour - 2nd circle
    @State private var circleTwoColor: Color = .orange
    
    // Control the rotation angle
    @State private var currentRotationAngle = Angle.degrees(0)
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    // MARK: Computed Properties
    var body: some View {
        
        VStack {
            
            Text("Loading...")
                .font(Font.custom("SF Compact", size: 25.0).bold())
                .foregroundColor(.orange)
            
            HStack {
                // Circle on the right
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(circleOneColor)
                    .offset(x: offsetX, y: 0.0)
                    .onReceive(timer) { input in
                        
                        withAnimation(
                            Animation.easeOut(duration: 1.0)
                                .repeatForever(autoreverses: true)
                            
                        ) {
                            offsetX = 100.0
                            
                            circleOneColor = .orange
                        }
                        
                        // Stop the timer
                        timer.upstream.connect().cancel()
                    }
                
                // Circle on the left
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(circleTwoColor)
                    .offset(x: offsetA, y: 0.0)
                    .onReceive(timer) { input in
                        withAnimation(
                            Animation
                                .easeOut(duration: 1.0)
                                .repeatForever(autoreverses: true)
                                .delay(2.0)
                        ) {
                            offsetA = -100.0

                            circleTwoColor = .red
                        }
                    
                        // Stop the timer
                        timer.upstream.connect().cancel()
                    }
            }
        }
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
