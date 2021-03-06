//
//  GalleryView.swift
//  Africa
//
//  Created by Chenran Jin on 7/25/21.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func  gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                        haptics.impactOccurred()
                    })
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView() )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

