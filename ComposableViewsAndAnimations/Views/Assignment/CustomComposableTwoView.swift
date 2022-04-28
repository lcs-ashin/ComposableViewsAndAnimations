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
            
            // Pink heart
            Image(systemName: pinkHeart)
                .font(.system(size: 100))
                .foregroundColor(.pink)
                .onTapGesture {
                    withAnimation(
                        Animation
                            .easeIn
                    ) {
                        pinkHeart = "heart.fill"
                        
                        heartOpacity = 1.0
                    }
                    
                    withAnimation(
                        Animation
                            .easeInOut(duration: 0.5)
                            .repeatCount(2, autoreverses: true)
                    ) {
                        heartSize += 0.2
                        
                        Task {
                            try await Task.sleep(nanoseconds: 0_800_000_000)
                            heartSize = 1.0
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
