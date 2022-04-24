//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Whether to apply the animation
    @State private var useAnimation = true
    
    // Controls the size of the circle
    @State private var scaleFactor: CGFloat = 1.0
    
    // Controls the colour of the circle
    @State private var hue: Color = .blue
    
    // Controls the position of the circle
    @State private var offset: CGFloat = -200.0

    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            VStack {

                Circle()
                    .foregroundColor(hue)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y: offset)
                    .onTapGesture {
                        if scaleFactor > 0.2 {
                            scaleFactor -= 0.1
                            hue = Color(hue: Double.random(in: 1...360),
                                        saturation: Double.random(in: 0.2...0.8),
                                        brightness: 0.8)
                            offset += 50
                            
                        } else {
                            scaleFactor = 1
                            hue = Color(hue: Double.random(in: 1...360),
                                        saturation: Double.random(in: 0.5...1.0),
                                        brightness: 0.8)
                            offset -= 400
                        }
                        
                    }
                    .animation(useAnimation ? .interpolatingSpring(stiffness: 5, damping: 3) : .none)
                    .animation(useAnimation ? .easeIn(duration: 1) : .none)
                
            }
            .navigationTitle("Exercise 1")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseOneView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOneView(showThisView: .constant(true))
    }
}
