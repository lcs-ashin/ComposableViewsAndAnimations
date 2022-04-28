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
    
    @State private var purpleHeartType: String = "heart"
    @State private var orangeHeartType: String = "heart"
    @State private var yellowHeartType: String = "heart"
    @State private var greenHeartType: String = "heart"
    @State private var blueHeartType: String = "heart"

    @State private var heartIsChosen: Bool = false
    
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
                    Image(systemName: purpleHeartType)
                        .font(Font.system(size: 40))
                        .foregroundColor(.purple)
                        .onTapGesture {
                            if heartIsChosen == false {
                                purpleHeartType = "heart.fill"
                                heartIsChosen = true
                                chooseColor = .purple
                                
                                orangeHeartType = "heart"
                                yellowHeartType = "heart"
                                greenHeartType = "heart"
                                blueHeartType = "heart"
                                
                            } else {
                                purpleHeartType = "heart"
                                heartIsChosen = false
                            }
                        }
                    
                    // Choose orange effect
                    Image(systemName: orangeHeartType)
                        .font(Font.system(size: 40))
                        .foregroundColor(.orange)
                        .onTapGesture {
                            if heartIsChosen == false {
                                orangeHeartType = "heart.fill"
                                heartIsChosen = true
                                chooseColor = .orange
                                
                                purpleHeartType = "heart"
                                yellowHeartType = "heart"
                                greenHeartType = "heart"
                                blueHeartType = "heart"
                                
                            } else {
                                orangeHeartType = "heart"
                                heartIsChosen = false
                            }
                        }
                    
                    // Choose yellow effect
                    Image(systemName: yellowHeartType)
                        .font(Font.system(size: 40))
                        .foregroundColor(.yellow)
                        .onTapGesture {
                            if heartIsChosen == false {
                                yellowHeartType = "heart.fill"
                                heartIsChosen = true
                                chooseColor = .yellow
                                
                                purpleHeartType = "heart"
                                orangeHeartType = "heart"
                                greenHeartType = "heart"
                                blueHeartType = "heart"
                                
                            } else {
                                yellowHeartType = "heart"
                                heartIsChosen = false
                            }
                        }
                    
                    // Choose green effect
                    Image(systemName: greenHeartType)
                        .font(Font.system(size: 40))
                        .foregroundColor(.green)
                        .onTapGesture {
                            if heartIsChosen == false {
                                greenHeartType = "heart.fill"
                                heartIsChosen = true
                                chooseColor = .green
                                
                                purpleHeartType = "heart"
                                orangeHeartType = "heart"
                                yellowHeartType = "heart"
                                blueHeartType = "heart"
                                
                            } else {
                                greenHeartType = "heart"
                                heartIsChosen = false
                            }
                        }
                    
                    // Choose blue effect
                    Image(systemName: blueHeartType)
                        .font(Font.system(size: 40))
                        .foregroundColor(.blue)
                        .onTapGesture {
                            if heartIsChosen == false {
                                blueHeartType = "heart.fill"
                                heartIsChosen = true
                                chooseColor = .blue
                                
                                purpleHeartType = "heart"
                                orangeHeartType = "heart"
                                yellowHeartType = "heart"
                                greenHeartType = "heart"
                                
                            } else {
                                blueHeartType = "heart"
                                heartIsChosen = false
                            }                        }
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
