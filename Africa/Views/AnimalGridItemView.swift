//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Chenran Jin on 7/25/21.
//

import SwiftUI

struct AnimalGridAItemView: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridAItemView_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridAItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
