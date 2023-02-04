//
//  ProfileView.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 1/31/23.
//

import SwiftUI

struct ProfileView: View {
    let url:String = "https://picsum.photos/400/400?random=1"
    @State var isSelected:Bool = true
    let columns = [
           GridItem(.adaptive(minimum: 100))
       ]
//    let rows = [
//          GridItem(.fixed(50)),
//          GridItem(.fixed(50)),
//          GridItem(.fixed(50))
//      ]
    var body: some View {
        NavigationView {
            ScrollView{
                ZStack{
                    Color.black
                        .ignoresSafeArea()
                    VStack{
                        HStack{
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFill()
                                .padding()
                                .padding()
                                .border(.red)
                                .frame(width: 150,height: 150)
                                .foregroundColor(Color.red)
                                .cornerRadius(75.0)
                                .overlay {
                                    Image(systemName: "plus")
                                        .foregroundColor(Color.blue)
                                        .cornerRadius(30.0)
                                }.frame(alignment: .bottomLeading)
                            Spacer()
                            VStack{
                                Text("4")
                                Text("Posts")
                            }
                            VStack{
                                Text("299")
                                Text("Followers")
                            }
                            VStack{
                                Text("299")
                                Text("Following")
                            }.foregroundColor(Color.white)
                        }
                        .padding()
                        HStack{
                            Text("Picsum Profile")
                                .bold()
                            Spacer()
                        }.padding(.leading,30)
                        HStack(spacing:5){
                            Text("Edit profile")
                                .padding(.horizontal,30)
                                .frame(width:.infinity,height:30)
                                .background(Color.secondary)
                                .cornerRadius(10.0)
                            Text("Share profile")
                                .frame(width:.infinity,height:30)
                                .padding(.horizontal,30)
                                .background(Color.secondary)
                                .cornerRadius(10.0)
                            Text("\(Image(systemName: "person.badge.plus"))")
                                .frame(width:.infinity,height:30)
                                .padding(.horizontal)
                                .background(Color.secondary)
                                .cornerRadius(10.0)
                        }.padding(.horizontal,10)
                        HStack{
                            VStack(alignment:.leading){
                                Text("Story highlights")
                                    .bold()
                                Text("Keep your favorite stories on your profile")
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text("^")
                                .bold()
                                .font(.title2)
                        }.padding()
                        
                        ScrollView(.horizontal){
                            HStack(spacing: 20){
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .border(Color.secondary)
                                    .frame(width: 75,height: 75)
                                ForEach(0..<10) {_ in
                                    Circle()
                                        .frame(width: 75,height: 75)
                                        .foregroundColor(Color.secondary)
                                }
                            }
                        }
                        HStack{
                            Spacer()
                            VStack{
                                Image(systemName: "squareshape.split.3x3")
                                    .resizable()
                                    .frame(width: 25,height: 25)
                                Rectangle()
                                    .foregroundColor(isSelected ? Color.white : Color.black)
                                    .frame(width: .infinity,height: 1)
                            }
                            Spacer()
                            VStack{
                                Image(systemName: "person.crop.square")
                                    .resizable()
                                    .frame(width: 25,height: 25)
                                Rectangle()
                                    .foregroundColor(isSelected ? Color.black : Color.white)
                                    .frame(width: .infinity,height: 1)
                            }
                            Spacer()
                        }
                        LazyVGrid(columns: columns, spacing: 3){
                            ForEach(0..<100, id: \.self) { id in
                                HStack(spacing:0){
                                    AsyncImage(url: URL(string: url)) { renderedImage in
                                        renderedImage
                                            .resizable()
                                            .frame(width:134,height: 134)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                            }
                        }
                    }
                }
                .background(Color.primary)
            }.foregroundColor(Color.white)
        }.navigationTitle(Text("ImageViewer"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
