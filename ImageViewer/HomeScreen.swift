//
//  HomeScreen.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 1/30/23.
//

import SwiftUI

struct HomeScreen: View {
    let url:String = "https://picsum.photos/400/400?random=1"
    var body: some View {
        ScrollView{
            LazyVStack(spacing:15.0){
                ForEach(0..<100, id: \.self) { id in
                    VStack(){
                        HStack{
                            Image(systemName: "person.fill")
                            Text("Picsum\(id)")
                                .font(.headline)
                                .bold()
                            Spacer()
                            Image(systemName: "ellipsis")
                        }
                        .padding(.horizontal)
                        AsyncImage(url: URL(string: url)) { renderedImage in
                            renderedImage
                                .resizable()
                                .cornerRadius(10.0)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: .infinity,height: 400)
                        .scaledToFit()
                        HStack{
                            Image(systemName: "heart")
                            Image(systemName: "message")
                            Image(systemName: "paperplane")
                            Spacer()
                            Image(systemName: "bookmark")
                        }
                        .padding(.horizontal)
                        HStack{
                            Image(systemName: "person.fill")
                            Text("Picsum\(id)")
                                .font(.headline)
                                .bold()
                            Spacer()
                        }
                        .padding(.vertical,10)
                        .padding(.leading)
                    }
                    }
            }
        }
        .scrollIndicators(.hidden)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
