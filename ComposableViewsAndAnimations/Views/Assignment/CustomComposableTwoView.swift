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
    @State var heartSize: CGFloat = 20
    
    // MARK: Computed Properties
    var body: some View {
        
        ZStack {
            // Purple heart
            Image(systemName: "heart.fill")
                .font(.system(size: 100))
                .foregroundColor(.purple)
            
            // Pink heart
            Image(systemName: pinkHeart)
                .font(.system(size: 100))
                .foregroundColor(.pink)
                .animation(
                    Animation
                        .easeIn
                )
                .onTapGesture {
                    pinkHeart = "heart.fill"
                }
        }
    }
}

struct CustomComposableTwoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableTwoView()
    }
}
