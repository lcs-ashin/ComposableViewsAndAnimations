//
//  CustomComposableTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Eunbi Shin on 2022-04-27.
//

import SwiftUI

struct CustomComposableTwoView: View {
    // MARK: Stored Properties
    // Controls the colour of the heart (filled / not filled)
    @State var pinkHeart: String = "heart"
    
    // Controls the size of the heart
    @State var heartSize: CGFloat = 1.0
    
    // Controls the size of the lines around heart (sun image)
    @State var circleSize: CGFloat = 1.2
    
    // Controls the opacity of the heart
    @State var heartOpacity: CGFloat = 0.0
    
    // MARK: Computed Properties
    var body: some View {
        
        ZStack {
            // Purple heart
            Image(systemName: "heart.fill")
                .font(.system(size: 100))
                .foregroundColor(.purple)
                .scaleEffect(heartSize)
                .opacity(heartOpacity)
            
            // Lines around heart effect
            Image(systemName: "sun.max")
                .font(.system(size: 100))
                .offset(x: 0, y: -2.5)
                .foregroundColor(.purple)
                .scaleEffect(circleSize)
                .opacity(heartOpacity)
            
            // Pink heart
            Image(systemName: pinkHeart)
                .font(.system(size: 100))
                .foregroundColor(.pink)
                .onTapGesture {
                    withAnimation(
                        Animation
                            .easeIn(duration: 0.3)
                    ) {
                        pinkHeart = "heart.fill"
                        
                        heartOpacity = 1.0
                    }
                    
                    withAnimation(
                        Animation
                            .easeInOut(duration: 0.3)
                            .repeatCount(2, autoreverses: true)
                    ) {
                        heartSize += 0.2
                        circleSize += 0.4
                        
                        Task {
                            try await Task.sleep(nanoseconds: 0_550_000_000)
                            heartSize = 1.0
                            circleSize = 1.0
                            heartOpacity = 0.0
                        }
                        
                    }
                }
        }
    }
}

struct CustomComposableTwoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableTwoView()
    }
}
