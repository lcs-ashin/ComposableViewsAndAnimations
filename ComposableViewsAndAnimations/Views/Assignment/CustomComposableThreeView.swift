//
//  CustomComposableThreeView.swift
//  ComposableViewsAndAnimations
//
//  Created by Eunbi Shin on 2022-04-29.
//

import SwiftUI

struct CustomComposableThreeView: View {
    // MARK: Stored Properties
    // Controls the position of the clouds
    @State var offsetXOne : CGFloat = -300
    @State var offsetXTwo : CGFloat = 200
    
    // Controls the opacity of the cloud
    @State var cloudOpacity : CGFloat = 0.0
    
    // Controls the opacity of the text
    @State var textOpacity : CGFloat = 0.0
    
    // Controls the opacity of the bolts
    @State var boltOneOpacity : CGFloat = 0.0
    @State var boltTwoOpacity : CGFloat = 0.0
    
    // Timer
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    
    // MARK: Computed Properties
    var body: some View {
        
        ZStack {
            HStack {
                // Cloud 1
                Image(systemName: "cloud.fill")
                    .font(.system(size: 150))
                    .foregroundColor(.secondary)
                    .offset(x: offsetXOne, y: -85)
                    .opacity(cloudOpacity)
                    .onReceive(timer) { input in
                        withAnimation(
                            Animation
                                .interpolatingSpring(stiffness: 7, damping: 3)
                        ) {
                            offsetXOne = -5
                        }
                        cloudOpacity = 1.0
                        timer.upstream.connect().cancel()
                    }
                
                // Cloud 2
                Image(systemName: "cloud.fill")
                    .font(.system(size: 110))
                    .foregroundColor(.secondary)
                    .offset(x: offsetXTwo, y: -70)
                    .onReceive(timer) { input in
                        withAnimation(
                            Animation
                                .interpolatingSpring(stiffness: 7, damping: 3)
                                .delay(0.5)
                        ) {
                            offsetXTwo = 3
                        }
                        
                        timer.upstream.connect().cancel()
                    }
            }
            
            // Bolt 1
            Image(systemName: "bolt.fill")
                .font(.system(size: 100))
                .foregroundColor(.yellow)
                .offset(x: -90, y: 35)
                .opacity(boltOneOpacity)
                .onReceive(timer) { input in
                    withAnimation(
                        Animation
                            .default
                            .repeatCount(3)
                            .delay(2.5)
                    ) {
                        boltOneOpacity = 1.0
                    }
                    
                    timer.upstream.connect().cancel()
                }
            
            // Bolt 2
            Image(systemName: "bolt.fill")
                .font(.system(size: 75))
                .foregroundColor(.yellow)
                .offset(x: 100, y: 19)
                .opacity(boltTwoOpacity)
                .onReceive(timer) { input in
                    withAnimation(
                        Animation
                            .default
                            .repeatCount(3)
                            .delay(2.6)
                    ) {
                        boltTwoOpacity = 1.0
                    }
                    
                    timer.upstream.connect().cancel()
                }
            
            // Try Again Text
            Text("Try Again")
                .font(Font.custom("Arial-BoldItalicMT", size: 30))
                .opacity(textOpacity)
                .onReceive(timer) { input in
                    withAnimation(
                        Animation
                            .easeOut(duration: 0.5)
                            .delay(2)
                    ) {
                        textOpacity = 1.0
                    }
                    
                    timer.upstream.connect().cancel()
                }
        }
    }
}

struct CustomComposableThreeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableThreeView()
    }
}
