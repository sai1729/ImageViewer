//
//  ContentView.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 1/30/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchBarText:String = ""
    @State var isSelected:Bool = false
    var body: some View {
        ScrollView{
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        TextField("  \(Image(systemName: "magnifyingglass")) Search", text: $searchBarText)
                            .multilineTextAlignment(.center)
                            .frame(width: .infinity,height:50,alignment: .center)
                            .foregroundColor(.primary)
                            .background(Color.secondary)
                            .cornerRadius(25.0)
                    }
                    .padding()
                    Spacer()
                    HStack {
                        HomeScreen()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
