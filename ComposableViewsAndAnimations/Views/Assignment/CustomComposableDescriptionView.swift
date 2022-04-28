//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var chooseColor: Color = .purple
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    My Composable View 1:
                    This is an animation that can be used in a loading page.
                    
                    My Composable View 2:
                    This is a heart button animation that can be used in social media.
                    Tap a colour you want for the effect.
                    """)
                
                HStack {
                    Spacer()
                    // Choose purple effect
                    Image(systemName: "heart")
                        .font(Font.system(size: 40))
                        .foregroundColor(.purple)
                        .onTapGesture {
                            chooseColor = .purple
                        }
                    
                    // Choose orange effect
                    Image(systemName: "heart")
                        .font(Font.system(size: 40))
                        .foregroundColor(.orange)
                        .onTapGesture {
                            chooseColor = .orange
                        }
                    
                    // Choose yellow effect
                    Image(systemName: "heart")
                        .font(Font.system(size: 40))
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            chooseColor = .yellow
                        }
                    
                    // Choose green effect
                    Image(systemName: "heart")
                        .font(Font.system(size: 40))
                        .foregroundColor(.green)
                        .onTapGesture {
                            chooseColor = .green
                        }
                    
                    // Choose blue effect
                    Image(systemName: "heart")
                        .font(Font.system(size: 40))
                        .foregroundColor(.blue)
                        .onTapGesture {
                            chooseColor = .blue
                        }
                    Spacer()
                }
                
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView()) {
                    SimpleListItemView(title: "My Composable View 1",
                                       caption: "A loading animation")
                }
                
                NavigationLink(destination: CustomComposableTwoView(effectColour: chooseColor)) {
                    SimpleListItemView(title: "My Composable View 2",
                                       caption: "A heart button with an effect")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
