//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    
    // MARK: Stored Properties
    // Control the horizontal offset
    @State private var offset = 0.0
    
    // Control the rotation angle
    @State private var currentRotationAngle = Angle.degrees(0)
    
    // MARK: Computed Properties
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
            
            Text("OK!")
                .foregroundColor(.white)
        }
        .rotationEffect(currentRotationAngle, anchor: .center)
        .offset(x: offset, y: 0)
        .onTapGesture {
            // Move the circle to the right
            offset = 100.0
            
            // Rotate a full revolution
            currentRotationAngle = .degrees(360)
        }
        .animation(
            Animation.easeOut(duration: 1.5)
        )

    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
