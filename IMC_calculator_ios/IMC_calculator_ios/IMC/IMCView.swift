//
//  IMCView.swift
//  IMC_calculator_ios
//
//  Created by opx-mac-mini-09 on 02/07/2024.
//

import SwiftUI

struct IMCView: View {
    
//    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    var body: some View {
        VStack{
            
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundApp).toolbar{
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator").foregroundColor(.white)
            }
        }
        
            //.navigationBarBackButtonHidden()
            //.navigationTitle("IMC Calculator")
    }
}

struct ToggleButton:View {
    let text: String
    let index:Int
    var body: some View {
        Button(action: {}) {
            Text("")
        }
    }
}

#Preview {
    IMCView()
}
