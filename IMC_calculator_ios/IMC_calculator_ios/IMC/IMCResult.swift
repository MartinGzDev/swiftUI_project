//
//  IMCResult.swift
//  IMC_calculator_ios
//
//  Created by opx-mac-mini-09 on 03/07/2024.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    
    var body: some View {
        VStack{
            Text("Tu resultado:").font(.title).bold().foregroundColor(.white)
            InformationView(result: calculateImc(weight: userWeight, height: userHeight))
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct InformationView: View {
    let result: Double
    var body: some View {
        let information = getImcResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundColor(information.2).font(.title).bold()
            Spacer()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80)).bold().foregroundColor(.white)
            Spacer()
            Text(information.1).foregroundColor(.white).font(.title2).padding(.horizontal, 8)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgraoundComponent).cornerRadius(16).padding(16)
    }
}

func calculateImc(weight: Double, height: Double) -> Double {
    return weight / ((height / 100) * (height / 100))
}

func getImcResult(result: Double) -> (String, String, Color){
    let title: String
    let description: String
    let color: Color
    
    switch result {
    case 0.00...19.99:
        title = "Peso bajo"
        description = "Estás por debajo del peso recomendado según el IMC."
        color = .yellow
    case 20.00...24.99:
        title = "Peso normal"
        description = "Estás en el peso recomendado según el IMC."
        color = .green
    case 25.00...29.99:
        title = "Sobrepeso"
        description = "Estás por encima del peso recomendado según el IMC."
        color = .orange
    case 30.00...100:
        title = "Obesidad"
        description = "Estás muy por encima del peso recomendado según el IMC."
        color = .red
    default:
        title = "ERROR"
        description = "ocurrio un error"
        color = Color.gray
    }
    
    return (title, description, color)
}

#Preview {
    IMCResult(userWeight: 10, userHeight: 20)
}
