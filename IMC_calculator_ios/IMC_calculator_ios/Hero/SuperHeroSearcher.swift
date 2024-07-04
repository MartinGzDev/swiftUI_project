//
//  SuperHeroSearcher.swift
//  IMC_calculator_ios
//
//  Created by opx-mac-mini-09 on 04/07/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroSearcher: View {
    
    @State var superHeroName: String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    @State var loading: Bool = false
    
    var body: some View {
        VStack{
            TextSearch(superHeroName: $superHeroName, wrapper: $wrapper, loading: $loading)
            if loading {
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(wrapper?.results ?? []) { superhero in
                    ZStack{
                        SuperHeroItem(superhero: superhero)
                        NavigationLink(destination: SuperHeroDetail(id: superhero.id)){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                    
                }.listStyle(.plain)
            }
            
            Spacer()
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct TextSearch: View {
    @Binding var superHeroName: String
    @Binding var wrapper: ApiNetwork.Wrapper?
    @Binding var loading: Bool
    var body: some View {
        TextField("", text: $superHeroName, prompt:
                    Text("Buscar...").font(.title2).bold().foregroundColor(.gray))
        .font(.title2)
        .bold()
        .foregroundColor(.white)
        .padding(16)
        .border(.purple, width: 2)
        .padding(10)
        .autocorrectionDisabled()
        .onSubmit {
            loading = true
            Task{
                do{
                    wrapper = try await ApiNetwork().getHeroesByQuery(query: superHeroName)
                    
                } catch{
                    print("error")
                }
                loading = false
            }
            
        }
    }
}

struct SuperHeroItem: View {
    let superhero: ApiNetwork.SuperHero
    var body: some View {
        ZStack{
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            
            VStack{
                Spacer()
                Text(superhero.name).foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32)
        
    }
}

#Preview {
    SuperHeroSearcher()
}
