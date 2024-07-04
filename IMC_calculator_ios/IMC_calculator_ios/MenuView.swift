//
//  MenuView.swift
//  IMC_calculator_ios
//
//  Created by opx-mac-mini-09 on 02/07/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        GeometryReader { geometry in
            NavigationStack{
                List{
                    NavigationLink(destination: IMCView()) {
                        Text("IMC Calculator")
                    }
                    NavigationLink(destination: SuperHeroSearcher()
                    ){
                        Text("Superhero Finder")
                    }
                }
                
            }
        }
    }
}

#Preview {
    MenuView()
}
