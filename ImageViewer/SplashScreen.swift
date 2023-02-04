//
//  SplashScreen.swift
//  ImageViewer
//
//  Created by Sai Krishna Dondeti on 1/30/23.
//

import SwiftUI

struct SplashScreen: View {
    @State var moveToMainContent:Bool = false
    var body: some View {
        ZStack{
            if moveToMainContent{
                LogInScreen()
            }else{
                SplashScreeImage()
            }
        }
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                moveToMainContent = true
            }
        }
    }
}

struct SplashScreeImage : View{
    var body: some View{
        Color.red
            .ignoresSafeArea()
        
        VStack{
            Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(Color.white)
                .frame(width: 40,height: 40)
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
