//
//  AstronautView.swift
//  MoonShot
//
//  Created by Rashad Surratt on 10/31/22.
//

import SwiftUI

struct AstronautView: View {
    
    @State private var showNavigationBar = false
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .cornerRadius(8)
                    .scaledToFit()
                    .padding()

                Text(astronaut.description)
                    .padding()
                    .font(.body.bold()).italic()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text(astronaut.name).font(.callout).bold().italic()
                    Spacer()
                    Image("nasa")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Capsule(style:.circular))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] =
    Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
