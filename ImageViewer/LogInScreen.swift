//
//  LogInScreen.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 1/30/23.
//

import SwiftUI

struct LogInScreen: View {
    @State var username:String = ""
    @State var password:String = ""
    
    var body: some View {
        NavigationView {
            TabView{
                ZStack{
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack(spacing: 30){
                        HStack{
                            Spacer()
                            Text("ImageViewer")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                            Image(systemName: "heart.fill")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(maxWidth: 50)
                                .scaledToFit()
                            Spacer()
                        }
                        .frame(width: .infinity,height: 50)
                        
                        VStack{
                            TextField("Phone number, username or email address", text: $username)
                                .frame(width: .infinity,height: 50)
                                .font(.subheadline)
                                .foregroundColor(Color.black)
                                .padding(.horizontal)
                                .background(Color.white)
                                .padding(.horizontal)
                            
                            
                            TextField("Password", text: $password)
                                .padding(.horizontal)
                                .font(.subheadline)
                                .foregroundColor(Color.black)
                                .frame(width: .infinity,height: 50)
                                .background(Color.white)
                                .padding(.horizontal)
                            
                            HStack{
                                Spacer()
                                Text("Forgot Password")
                                    .foregroundColor(Color(#colorLiteral(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)))
                            }.padding(.horizontal)
                            
                            NavigationLink(destination: MainView()) {
                                Text("Login")
                                    .foregroundColor(Color.white)
                                    .frame(maxWidth: .infinity,maxHeight: 50)
                            }
                            .frame(maxWidth: .infinity,maxHeight: 50)
                            .border(.pink)
                            .background(Color.blue)
                            .padding(.horizontal)
                            
//                            Button("Login") {
//                            }
//                            .buttonStyle(.borderedProminent)
//                            .frame(maxWidth: .infinity,maxHeight: 50)
//                            .border(.pink)
//                            .background(Color.blue)
//                            .padding(.horizontal)
                            
                        }
                        
                        HStack{
                            Rectangle()
                                .frame(maxWidth: .infinity,maxHeight: 1)
                                .foregroundColor(Color.white)
                            Spacer()
                            Text("OR")
                                .foregroundColor(Color.white)
                            Spacer()
                            Rectangle()
                                .frame(maxWidth: .infinity,maxHeight: 1)
                                .foregroundColor(Color.white)
                            
                        }
                        .padding(.horizontal)
                        
                        HStack{
                            Spacer()
                            Image(systemName: "heart")
                                .foregroundColor(.white)
                            NavigationLink(destination: SearchView()) {
                                Text("Login with ImageViewer")
                                    .padding(.trailing)
                                    .foregroundColor(.white)
                                    .foregroundColor(Color(#colorLiteral(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)))
                                    .underline()
                            }
                            Spacer()
                        }
                        
                    }
                }.tabItem {
                    HStack{
                        Text("Don't have an account? Sign Up")
                        NavigationLink(destination: SearchView()) {
                            Text("Sign Up")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        
    }
}



struct LogInScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogInScreen()
    }
}

