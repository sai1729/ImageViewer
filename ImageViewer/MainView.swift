//
//  MainView.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 1/30/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeScreen()
                    .tabItem {
                        Image(systemName: "house.fill")
                            .foregroundColor(Color.secondary)
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.secondary)
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                            .foregroundColor(Color.secondary)
                    }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:HStack{
                Image(systemName: "heart.fill")
                Text("ImageViewer")
                    .underline()
                    .bold()
                    .font(.headline)
            }, trailing:HStack{
                Image(systemName: "plus.square")
                    .cornerRadius(10.0)
                Image(systemName: "heart")
                Image(systemName: "message.fill")
            })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
